using CEnum: CEnum, @cenum

const INT8_MAX = typemax(Int8)


"""
    aws_event_stream_errors

Documentation not found.
"""
@cenum aws_event_stream_errors::UInt32 begin
    AWS_ERROR_EVENT_STREAM_BUFFER_LENGTH_MISMATCH = 4096
    AWS_ERROR_EVENT_STREAM_INSUFFICIENT_BUFFER_LEN = 4097
    AWS_ERROR_EVENT_STREAM_MESSAGE_FIELD_SIZE_EXCEEDED = 4098
    AWS_ERROR_EVENT_STREAM_PRELUDE_CHECKSUM_FAILURE = 4099
    AWS_ERROR_EVENT_STREAM_MESSAGE_CHECKSUM_FAILURE = 4100
    AWS_ERROR_EVENT_STREAM_MESSAGE_INVALID_HEADERS_LEN = 4101
    AWS_ERROR_EVENT_STREAM_MESSAGE_UNKNOWN_HEADER_TYPE = 4102
    AWS_ERROR_EVENT_STREAM_MESSAGE_PARSER_ILLEGAL_STATE = 4103
    AWS_ERROR_EVENT_STREAM_RPC_CONNECTION_CLOSED = 4104
    AWS_ERROR_EVENT_STREAM_RPC_PROTOCOL_ERROR = 4105
    AWS_ERROR_EVENT_STREAM_RPC_STREAM_CLOSED = 4106
    AWS_ERROR_EVENT_STREAM_RPC_STREAM_NOT_ACTIVATED = 4107
    AWS_ERROR_EVENT_STREAM_END_RANGE = 5119
end

"""
    aws_event_stream_log_subject

Documentation not found.
"""
@cenum aws_event_stream_log_subject::UInt32 begin
    AWS_LS_EVENT_STREAM_GENERAL = 4096
    AWS_LS_EVENT_STREAM_CHANNEL_HANDLER = 4097
    AWS_LS_EVENT_STREAM_RPC_SERVER = 4098
    AWS_LS_EVENT_STREAM_RPC_CLIENT = 4099
    AWS_LS_EVENT_STREAM_LAST = 5119
end

"""
    aws_event_stream_message_prelude

Documentation not found.
"""
struct aws_event_stream_message_prelude
    total_len::UInt32
    headers_len::UInt32
    prelude_crc::UInt32
end

"""
    aws_event_stream_message

Documentation not found.
"""
struct aws_event_stream_message
    alloc::Ptr{aws_allocator}
    message_buffer::aws_byte_buf
end

"""
    aws_event_stream_header_value_type

Documentation not found.
"""
@cenum aws_event_stream_header_value_type::UInt32 begin
    AWS_EVENT_STREAM_HEADER_BOOL_TRUE = 0
    AWS_EVENT_STREAM_HEADER_BOOL_FALSE = 1
    AWS_EVENT_STREAM_HEADER_BYTE = 2
    AWS_EVENT_STREAM_HEADER_INT16 = 3
    AWS_EVENT_STREAM_HEADER_INT32 = 4
    AWS_EVENT_STREAM_HEADER_INT64 = 5
    AWS_EVENT_STREAM_HEADER_BYTE_BUF = 6
    AWS_EVENT_STREAM_HEADER_STRING = 7
    AWS_EVENT_STREAM_HEADER_TIMESTAMP = 8
    AWS_EVENT_STREAM_HEADER_UUID = 9
end

"""
    __JL_Ctag_91

Documentation not found.
"""
struct __JL_Ctag_91
    data::NTuple{16, UInt8}
end

function Base.getproperty(x::Ptr{__JL_Ctag_91}, f::Symbol)
    f === :variable_len_val && return Ptr{Ptr{UInt8}}(x + 0)
    f === :static_val && return Ptr{NTuple{16, UInt8}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_91, f::Symbol)
    r = Ref{__JL_Ctag_91}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_91}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_91}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

function Base.propertynames(x::__JL_Ctag_91, private::Bool = false)
    (:variable_len_val, :static_val, if private
            fieldnames(typeof(x))
        else
            ()
        end...)
end

"""
    aws_event_stream_header_value_pair

Documentation not found.
"""
struct aws_event_stream_header_value_pair
    data::NTuple{160, UInt8}
end

function Base.getproperty(x::Ptr{aws_event_stream_header_value_pair}, f::Symbol)
    f === :header_name_len && return Ptr{UInt8}(x + 0)
    f === :header_name && return Ptr{NTuple{127, Cchar}}(x + 1)
    f === :header_value_type && return Ptr{aws_event_stream_header_value_type}(x + 128)
    f === :header_value && return Ptr{__JL_Ctag_91}(x + 136)
    f === :header_value_len && return Ptr{UInt16}(x + 152)
    f === :value_owned && return Ptr{Int8}(x + 154)
    return getfield(x, f)
end

function Base.getproperty(x::aws_event_stream_header_value_pair, f::Symbol)
    r = Ref{aws_event_stream_header_value_pair}(x)
    ptr = Base.unsafe_convert(Ptr{aws_event_stream_header_value_pair}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{aws_event_stream_header_value_pair}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

function Base.propertynames(x::aws_event_stream_header_value_pair, private::Bool = false)
    (:header_name_len, :header_name, :header_value_type, :header_value, :header_value_len, :value_owned, if private
            fieldnames(typeof(x))
        else
            ()
        end...)
end

# typedef int ( aws_event_stream_process_state_fn ) ( struct aws_event_stream_streaming_decoder * decoder , const uint8_t * data , size_t len , size_t * processed )
"""
Documentation not found.
"""
const aws_event_stream_process_state_fn = Cvoid

# typedef void ( aws_event_stream_process_on_payload_segment_fn ) ( struct aws_event_stream_streaming_decoder * decoder , struct aws_byte_buf * payload , int8_t final_segment , void * user_data )
"""
Called by aws\\_aws\\_event\\_stream\\_streaming\\_decoder when payload data has been received. 'data' doesn't belong to you, so copy the data if it is needed beyond the scope of your callback. final\\_segment == 1 indicates the current data is the last payload buffer for that message.
"""
const aws_event_stream_process_on_payload_segment_fn = Cvoid

# typedef void ( aws_event_stream_prelude_received_fn ) ( struct aws_event_stream_streaming_decoder * decoder , struct aws_event_stream_message_prelude * prelude , void * user_data )
"""
Called by aws\\_aws\\_event\\_stream\\_streaming\\_decoder when a new message has arrived. The prelude will contain metadata about the message. At this point no headers or payload have been received. prelude is copyable.
"""
const aws_event_stream_prelude_received_fn = Cvoid

# typedef void ( aws_event_stream_header_received_fn ) ( struct aws_event_stream_streaming_decoder * decoder , struct aws_event_stream_message_prelude * prelude , struct aws_event_stream_header_value_pair * header , void * user_data )
"""
Called by aws\\_aws\\_event\\_stream\\_streaming\\_decoder when a header is encountered. 'header' is not yours. Copy the data you want from it if your scope extends beyond your callback.
"""
const aws_event_stream_header_received_fn = Cvoid

# typedef void ( aws_event_stream_on_complete_fn ) ( struct aws_event_stream_streaming_decoder * decoder , uint32_t message_crc , void * user_data )
"""
Called by aws\\_aws\\_event\\_stream\\_streaming\\_decoder when a message decoding is complete and crc is verified.
"""
const aws_event_stream_on_complete_fn = Cvoid

# typedef void ( aws_event_stream_on_error_fn ) ( struct aws_event_stream_streaming_decoder * decoder , struct aws_event_stream_message_prelude * prelude , int error_code , const char * message , void * user_data )
"""
Called by aws\\_aws\\_event\\_stream\\_streaming\\_decoder when an error is encountered. The decoder is not in a good state for usage after this callback.
"""
const aws_event_stream_on_error_fn = Cvoid

"""
    aws_event_stream_streaming_decoder

Documentation not found.
"""
struct aws_event_stream_streaming_decoder
    data::NTuple{288, UInt8}
end

function Base.getproperty(x::Ptr{aws_event_stream_streaming_decoder}, f::Symbol)
    f === :alloc && return Ptr{Ptr{aws_allocator}}(x + 0)
    f === :working_buffer && return Ptr{NTuple{12, UInt8}}(x + 8)
    f === :message_pos && return Ptr{Csize_t}(x + 24)
    f === :running_crc && return Ptr{UInt32}(x + 32)
    f === :current_header_name_offset && return Ptr{Csize_t}(x + 40)
    f === :current_header_value_offset && return Ptr{Csize_t}(x + 48)
    f === :current_header && return Ptr{aws_event_stream_header_value_pair}(x + 56)
    f === :prelude && return Ptr{aws_event_stream_message_prelude}(x + 216)
    f === :state && return Ptr{Ptr{aws_event_stream_process_state_fn}}(x + 232)
    f === :on_payload && return Ptr{Ptr{aws_event_stream_process_on_payload_segment_fn}}(x + 240)
    f === :on_prelude && return Ptr{Ptr{aws_event_stream_prelude_received_fn}}(x + 248)
    f === :on_header && return Ptr{Ptr{aws_event_stream_header_received_fn}}(x + 256)
    f === :on_complete && return Ptr{Ptr{aws_event_stream_on_complete_fn}}(x + 264)
    f === :on_error && return Ptr{Ptr{aws_event_stream_on_error_fn}}(x + 272)
    f === :user_context && return Ptr{Ptr{Cvoid}}(x + 280)
    return getfield(x, f)
end

function Base.getproperty(x::aws_event_stream_streaming_decoder, f::Symbol)
    r = Ref{aws_event_stream_streaming_decoder}(x)
    ptr = Base.unsafe_convert(Ptr{aws_event_stream_streaming_decoder}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{aws_event_stream_streaming_decoder}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

function Base.propertynames(x::aws_event_stream_streaming_decoder, private::Bool = false)
    (:alloc, :working_buffer, :message_pos, :running_crc, :current_header_name_offset, :current_header_value_offset, :current_header, :prelude, :state, :on_payload, :on_prelude, :on_header, :on_complete, :on_error, :user_context, if private
            fieldnames(typeof(x))
        else
            ()
        end...)
end

"""
    aws_event_stream_streaming_decoder_options

Documentation not found.
"""
struct aws_event_stream_streaming_decoder_options
    on_payload_segment::Ptr{aws_event_stream_process_on_payload_segment_fn}
    on_prelude::Ptr{aws_event_stream_prelude_received_fn}
    on_header::Ptr{aws_event_stream_header_received_fn}
    on_complete::Ptr{aws_event_stream_on_complete_fn}
    on_error::Ptr{aws_event_stream_on_error_fn}
    user_data::Ptr{Cvoid}
end

"""
    aws_event_stream_message_init(message, alloc, headers, payload)

Initializes with a list of headers, the payload, and a payload length. CRCs will be computed for you. If headers or payload is NULL, then the fields will be appropriately set to indicate no headers and/or no payload. Both payload and headers will result in an allocation.

### Prototype
```c
int aws_event_stream_message_init( struct aws_event_stream_message *message, struct aws_allocator *alloc, const struct aws_array_list *headers, const struct aws_byte_buf *payload);
```
"""
function aws_event_stream_message_init(message, alloc, headers, payload)
    ccall((:aws_event_stream_message_init, libaws_c_event_stream), Cint, (Ptr{aws_event_stream_message}, Ptr{aws_allocator}, Ptr{Cvoid}, Ptr{aws_byte_buf}), message, alloc, headers, payload)
end

"""
    aws_event_stream_message_from_buffer(message, alloc, buffer)

Zero allocation, Zero copy. The message will simply wrap the buffer. The message functions are only useful as long as buffer is referencable memory.

### Prototype
```c
int aws_event_stream_message_from_buffer( struct aws_event_stream_message *message, struct aws_allocator *alloc, struct aws_byte_buf *buffer);
```
"""
function aws_event_stream_message_from_buffer(message, alloc, buffer)
    ccall((:aws_event_stream_message_from_buffer, libaws_c_event_stream), Cint, (Ptr{aws_event_stream_message}, Ptr{aws_allocator}, Ptr{aws_byte_buf}), message, alloc, buffer)
end

"""
    aws_event_stream_message_from_buffer_copy(message, alloc, buffer)

Allocates memory and copies buffer. Otherwise the same as aws\\_aws\\_event\\_stream\\_message\\_from\\_buffer. This is slower, but possibly safer.

### Prototype
```c
int aws_event_stream_message_from_buffer_copy( struct aws_event_stream_message *message, struct aws_allocator *alloc, const struct aws_byte_buf *buffer);
```
"""
function aws_event_stream_message_from_buffer_copy(message, alloc, buffer)
    ccall((:aws_event_stream_message_from_buffer_copy, libaws_c_event_stream), Cint, (Ptr{aws_event_stream_message}, Ptr{aws_allocator}, Ptr{aws_byte_buf}), message, alloc, buffer)
end

"""
    aws_event_stream_message_clean_up(message)

Cleans up any internally allocated memory. Always call this for API compatibility reasons, even if you only used the aws\\_aws\\_event\\_stream\\_message\\_from\\_buffer function.

### Prototype
```c
void aws_event_stream_message_clean_up(struct aws_event_stream_message *message);
```
"""
function aws_event_stream_message_clean_up(message)
    ccall((:aws_event_stream_message_clean_up, libaws_c_event_stream), Cvoid, (Ptr{aws_event_stream_message},), message)
end

"""
    aws_event_stream_message_total_length(message)

Returns the total length of the message (including the length field).

### Prototype
```c
uint32_t aws_event_stream_message_total_length(const struct aws_event_stream_message *message);
```
"""
function aws_event_stream_message_total_length(message)
    ccall((:aws_event_stream_message_total_length, libaws_c_event_stream), UInt32, (Ptr{aws_event_stream_message},), message)
end

"""
    aws_event_stream_message_headers_len(message)

Returns the length of the headers portion of the message.

### Prototype
```c
uint32_t aws_event_stream_message_headers_len(const struct aws_event_stream_message *message);
```
"""
function aws_event_stream_message_headers_len(message)
    ccall((:aws_event_stream_message_headers_len, libaws_c_event_stream), UInt32, (Ptr{aws_event_stream_message},), message)
end

"""
    aws_event_stream_message_prelude_crc(message)

Returns the prelude crc (crc32)

### Prototype
```c
uint32_t aws_event_stream_message_prelude_crc(const struct aws_event_stream_message *message);
```
"""
function aws_event_stream_message_prelude_crc(message)
    ccall((:aws_event_stream_message_prelude_crc, libaws_c_event_stream), UInt32, (Ptr{aws_event_stream_message},), message)
end

"""
    aws_event_stream_message_to_debug_str(fd, message)

Writes the message to fd in json format. All strings and binary fields are base64 encoded.

### Prototype
```c
int aws_event_stream_message_to_debug_str( FILE *fd, const struct aws_event_stream_message *message);
```
"""
function aws_event_stream_message_to_debug_str(fd, message)
    ccall((:aws_event_stream_message_to_debug_str, libaws_c_event_stream), Cint, (Ptr{Libc.FILE}, Ptr{aws_event_stream_message}), fd, message)
end

"""
    aws_event_stream_message_headers(message, headers)

Adds the headers for the message to list. The memory in each header is owned as part of the message, do not free it or pass its address around.

### Prototype
```c
int aws_event_stream_message_headers( const struct aws_event_stream_message *message, struct aws_array_list *headers);
```
"""
function aws_event_stream_message_headers(message, headers)
    ccall((:aws_event_stream_message_headers, libaws_c_event_stream), Cint, (Ptr{aws_event_stream_message}, Ptr{Cvoid}), message, headers)
end

"""
    aws_event_stream_message_payload(message)

Returns a pointer to the beginning of the message payload.

### Prototype
```c
const uint8_t *aws_event_stream_message_payload(const struct aws_event_stream_message *message);
```
"""
function aws_event_stream_message_payload(message)
    ccall((:aws_event_stream_message_payload, libaws_c_event_stream), Ptr{UInt8}, (Ptr{aws_event_stream_message},), message)
end

"""
    aws_event_stream_message_payload_len(message)

Returns the length of the message payload.

### Prototype
```c
uint32_t aws_event_stream_message_payload_len(const struct aws_event_stream_message *message);
```
"""
function aws_event_stream_message_payload_len(message)
    ccall((:aws_event_stream_message_payload_len, libaws_c_event_stream), UInt32, (Ptr{aws_event_stream_message},), message)
end

"""
    aws_event_stream_message_message_crc(message)

Returns the checksum of the entire message (crc32)

### Prototype
```c
uint32_t aws_event_stream_message_message_crc(const struct aws_event_stream_message *message);
```
"""
function aws_event_stream_message_message_crc(message)
    ccall((:aws_event_stream_message_message_crc, libaws_c_event_stream), UInt32, (Ptr{aws_event_stream_message},), message)
end

"""
    aws_event_stream_message_buffer(message)

Returns the message as a buffer ready for transport.

### Prototype
```c
const uint8_t *aws_event_stream_message_buffer(const struct aws_event_stream_message *message);
```
"""
function aws_event_stream_message_buffer(message)
    ccall((:aws_event_stream_message_buffer, libaws_c_event_stream), Ptr{UInt8}, (Ptr{aws_event_stream_message},), message)
end

"""
    aws_event_stream_compute_headers_required_buffer_len(headers)

Documentation not found.
### Prototype
```c
uint32_t aws_event_stream_compute_headers_required_buffer_len(const struct aws_array_list *headers);
```
"""
function aws_event_stream_compute_headers_required_buffer_len(headers)
    ccall((:aws_event_stream_compute_headers_required_buffer_len, libaws_c_event_stream), UInt32, (Ptr{Cvoid},), headers)
end

"""
    aws_event_stream_write_headers_to_buffer_safe(headers, buf)

Writes headers to buf assuming buf is large enough to hold the data. Prefer this function over the unsafe variant '[`aws_event_stream_write_headers_to_buffer`](@ref)'.

Returns AWS\\_OP\\_SUCCESS if the headers were successfully and completely written and AWS\\_OP\\_ERR otherwise.

### Prototype
```c
int aws_event_stream_write_headers_to_buffer_safe( const struct aws_array_list *headers, struct aws_byte_buf *buf);
```
"""
function aws_event_stream_write_headers_to_buffer_safe(headers, buf)
    ccall((:aws_event_stream_write_headers_to_buffer_safe, libaws_c_event_stream), Cint, (Ptr{Cvoid}, Ptr{aws_byte_buf}), headers, buf)
end

"""
    aws_event_stream_write_headers_to_buffer(headers, buffer)

Deprecated in favor of '[`aws_event_stream_write_headers_to_buffer_safe`](@ref)' as this API is unsafe.

Writes headers to buffer and returns the length of bytes written to buffer. Assumes buffer is large enough to store the headers.

### Prototype
```c
size_t aws_event_stream_write_headers_to_buffer(const struct aws_array_list *headers, uint8_t *buffer);
```
"""
function aws_event_stream_write_headers_to_buffer(headers, buffer)
    ccall((:aws_event_stream_write_headers_to_buffer, libaws_c_event_stream), Csize_t, (Ptr{Cvoid}, Ptr{UInt8}), headers, buffer)
end

"""
    aws_event_stream_read_headers_from_buffer(headers, buffer, headers_len)

Get the headers from the buffer, store them in the headers list. the user's responsibility to cleanup the list when they are finished with it. no buffer copies happen here, the lifetime of the buffer, must outlive the usage of the headers. returns error codes defined in the public interface.

### Prototype
```c
int aws_event_stream_read_headers_from_buffer( struct aws_array_list *headers, const uint8_t *buffer, size_t headers_len);
```
"""
function aws_event_stream_read_headers_from_buffer(headers, buffer, headers_len)
    ccall((:aws_event_stream_read_headers_from_buffer, libaws_c_event_stream), Cint, (Ptr{Cvoid}, Ptr{UInt8}, Csize_t), headers, buffer, headers_len)
end

"""
    aws_event_stream_streaming_decoder_init_from_options(decoder, allocator, options)

Initialize a streaming decoder for messages with callbacks for usage and an optional user context pointer.

### Prototype
```c
void aws_event_stream_streaming_decoder_init_from_options( struct aws_event_stream_streaming_decoder *decoder, struct aws_allocator *allocator, const struct aws_event_stream_streaming_decoder_options *options);
```
"""
function aws_event_stream_streaming_decoder_init_from_options(decoder, allocator, options)
    ccall((:aws_event_stream_streaming_decoder_init_from_options, libaws_c_event_stream), Cvoid, (Ptr{aws_event_stream_streaming_decoder}, Ptr{aws_allocator}, Ptr{aws_event_stream_streaming_decoder_options}), decoder, allocator, options)
end

"""
    aws_event_stream_streaming_decoder_init(decoder, alloc, on_payload_segment, on_prelude, on_header, on_error, user_data)

Deprecated. Use [`aws_event_stream_streaming_decoder_init_from_options`](@ref) instead. Initialize a streaming decoder for messages with callbacks for usage and an optional user context pointer.

### Prototype
```c
void aws_event_stream_streaming_decoder_init( struct aws_event_stream_streaming_decoder *decoder, struct aws_allocator *alloc, aws_event_stream_process_on_payload_segment_fn *on_payload_segment, aws_event_stream_prelude_received_fn *on_prelude, aws_event_stream_header_received_fn *on_header, aws_event_stream_on_error_fn *on_error, void *user_data);
```
"""
function aws_event_stream_streaming_decoder_init(decoder, alloc, on_payload_segment, on_prelude, on_header, on_error, user_data)
    ccall((:aws_event_stream_streaming_decoder_init, libaws_c_event_stream), Cvoid, (Ptr{aws_event_stream_streaming_decoder}, Ptr{aws_allocator}, Ptr{aws_event_stream_process_on_payload_segment_fn}, Ptr{aws_event_stream_prelude_received_fn}, Ptr{aws_event_stream_header_received_fn}, Ptr{aws_event_stream_on_error_fn}, Ptr{Cvoid}), decoder, alloc, on_payload_segment, on_prelude, on_header, on_error, user_data)
end

"""
    aws_event_stream_streaming_decoder_clean_up(decoder)

Currently, no memory is allocated inside aws\\_aws\\_event\\_stream\\_streaming\\_decoder, but for future API compatibility, you should call this when finished with it.

### Prototype
```c
void aws_event_stream_streaming_decoder_clean_up( struct aws_event_stream_streaming_decoder *decoder);
```
"""
function aws_event_stream_streaming_decoder_clean_up(decoder)
    ccall((:aws_event_stream_streaming_decoder_clean_up, libaws_c_event_stream), Cvoid, (Ptr{aws_event_stream_streaming_decoder},), decoder)
end

"""
    aws_event_stream_headers_list_init(headers, allocator)

initializes a headers list for you. It will default to a capacity of 4 in dynamic mode.

### Prototype
```c
int aws_event_stream_headers_list_init( struct aws_array_list *headers, struct aws_allocator *allocator);
```
"""
function aws_event_stream_headers_list_init(headers, allocator)
    ccall((:aws_event_stream_headers_list_init, libaws_c_event_stream), Cint, (Ptr{Cvoid}, Ptr{aws_allocator}), headers, allocator)
end

"""
    aws_event_stream_headers_list_cleanup(headers)

Cleans up the headers list. Also deallocates any headers that were the result of a copy flag for strings or buffer.

### Prototype
```c
void aws_event_stream_headers_list_cleanup(struct aws_array_list *headers);
```
"""
function aws_event_stream_headers_list_cleanup(headers)
    ccall((:aws_event_stream_headers_list_cleanup, libaws_c_event_stream), Cvoid, (Ptr{Cvoid},), headers)
end

"""
    aws_event_stream_add_string_header(headers, name, name_len, value, value_len, copy)

Adds a string header to the list of headers. If copy is set to true, this will result in an allocation for the header value. Otherwise, the value will be set to the memory address of 'value'.

### Prototype
```c
int aws_event_stream_add_string_header( struct aws_array_list *headers, const char *name, uint8_t name_len, const char *value, uint16_t value_len, int8_t copy);
```
"""
function aws_event_stream_add_string_header(headers, name, name_len, value, value_len, copy)
    ccall((:aws_event_stream_add_string_header, libaws_c_event_stream), Cint, (Ptr{Cvoid}, Ptr{Cchar}, UInt8, Ptr{Cchar}, UInt16, Int8), headers, name, name_len, value, value_len, copy)
end

"""
    aws_event_stream_create_string_header(name, value)

Documentation not found.
### Prototype
```c
struct aws_event_stream_header_value_pair aws_event_stream_create_string_header( struct aws_byte_cursor name, struct aws_byte_cursor value);
```
"""
function aws_event_stream_create_string_header(name, value)
    ccall((:aws_event_stream_create_string_header, libaws_c_event_stream), aws_event_stream_header_value_pair, (aws_byte_cursor, aws_byte_cursor), name, value)
end

"""
    aws_event_stream_create_int32_header(name, value)

Documentation not found.
### Prototype
```c
struct aws_event_stream_header_value_pair aws_event_stream_create_int32_header( struct aws_byte_cursor name, int32_t value);
```
"""
function aws_event_stream_create_int32_header(name, value)
    ccall((:aws_event_stream_create_int32_header, libaws_c_event_stream), aws_event_stream_header_value_pair, (aws_byte_cursor, Int32), name, value)
end

"""
    aws_event_stream_add_byte_header(headers, name, name_len, value)

Adds a byte header to the list of headers.

### Prototype
```c
int aws_event_stream_add_byte_header( struct aws_array_list *headers, const char *name, uint8_t name_len, int8_t value);
```
"""
function aws_event_stream_add_byte_header(headers, name, name_len, value)
    ccall((:aws_event_stream_add_byte_header, libaws_c_event_stream), Cint, (Ptr{Cvoid}, Ptr{Cchar}, UInt8, Int8), headers, name, name_len, value)
end

"""
    aws_event_stream_add_bool_header(headers, name, name_len, value)

Adds a bool header to the list of headers.

### Prototype
```c
int aws_event_stream_add_bool_header( struct aws_array_list *headers, const char *name, uint8_t name_len, int8_t value);
```
"""
function aws_event_stream_add_bool_header(headers, name, name_len, value)
    ccall((:aws_event_stream_add_bool_header, libaws_c_event_stream), Cint, (Ptr{Cvoid}, Ptr{Cchar}, UInt8, Int8), headers, name, name_len, value)
end

"""
    aws_event_stream_add_int16_header(headers, name, name_len, value)

adds a 16 bit integer to the list of headers.

### Prototype
```c
int aws_event_stream_add_int16_header( struct aws_array_list *headers, const char *name, uint8_t name_len, int16_t value);
```
"""
function aws_event_stream_add_int16_header(headers, name, name_len, value)
    ccall((:aws_event_stream_add_int16_header, libaws_c_event_stream), Cint, (Ptr{Cvoid}, Ptr{Cchar}, UInt8, Int16), headers, name, name_len, value)
end

"""
    aws_event_stream_add_int32_header(headers, name, name_len, value)

adds a 32 bit integer to the list of headers.

### Prototype
```c
int aws_event_stream_add_int32_header( struct aws_array_list *headers, const char *name, uint8_t name_len, int32_t value);
```
"""
function aws_event_stream_add_int32_header(headers, name, name_len, value)
    ccall((:aws_event_stream_add_int32_header, libaws_c_event_stream), Cint, (Ptr{Cvoid}, Ptr{Cchar}, UInt8, Int32), headers, name, name_len, value)
end

"""
    aws_event_stream_add_int64_header(headers, name, name_len, value)

adds a 64 bit integer to the list of headers.

### Prototype
```c
int aws_event_stream_add_int64_header( struct aws_array_list *headers, const char *name, uint8_t name_len, int64_t value);
```
"""
function aws_event_stream_add_int64_header(headers, name, name_len, value)
    ccall((:aws_event_stream_add_int64_header, libaws_c_event_stream), Cint, (Ptr{Cvoid}, Ptr{Cchar}, UInt8, Int64), headers, name, name_len, value)
end

"""
    aws_event_stream_add_bytebuf_header(headers, name, name_len, value, value_len, copy)

Adds a byte-buffer header to the list of headers. If copy is set to true, this will result in an allocation for the header value. Otherwise, the value will be set to the memory address of 'value'.

### Prototype
```c
int aws_event_stream_add_bytebuf_header( struct aws_array_list *headers, const char *name, uint8_t name_len, uint8_t *value, uint16_t value_len, int8_t copy);
```
"""
function aws_event_stream_add_bytebuf_header(headers, name, name_len, value, value_len, copy)
    ccall((:aws_event_stream_add_bytebuf_header, libaws_c_event_stream), Cint, (Ptr{Cvoid}, Ptr{Cchar}, UInt8, Ptr{UInt8}, UInt16, Int8), headers, name, name_len, value, value_len, copy)
end

"""
    aws_event_stream_add_timestamp_header(headers, name, name_len, value)

adds a 64 bit integer representing milliseconds since unix epoch to the list of headers.

### Prototype
```c
int aws_event_stream_add_timestamp_header( struct aws_array_list *headers, const char *name, uint8_t name_len, int64_t value);
```
"""
function aws_event_stream_add_timestamp_header(headers, name, name_len, value)
    ccall((:aws_event_stream_add_timestamp_header, libaws_c_event_stream), Cint, (Ptr{Cvoid}, Ptr{Cchar}, UInt8, Int64), headers, name, name_len, value)
end

"""
    aws_event_stream_add_uuid_header(headers, name, name_len, value)

adds a uuid buffer to the list of headers. Value must always be 16 bytes long.

### Prototype
```c
int aws_event_stream_add_uuid_header( struct aws_array_list *headers, const char *name, uint8_t name_len, const uint8_t *value);
```
"""
function aws_event_stream_add_uuid_header(headers, name, name_len, value)
    ccall((:aws_event_stream_add_uuid_header, libaws_c_event_stream), Cint, (Ptr{Cvoid}, Ptr{Cchar}, UInt8, Ptr{UInt8}), headers, name, name_len, value)
end

"""
    aws_event_stream_add_header(headers, header)

Adds a generic header to the list of headers. Makes a copy of the underlaying data.

### Prototype
```c
int aws_event_stream_add_header( struct aws_array_list *headers, const struct aws_event_stream_header_value_pair *header);
```
"""
function aws_event_stream_add_header(headers, header)
    ccall((:aws_event_stream_add_header, libaws_c_event_stream), Cint, (Ptr{Cvoid}, Ptr{aws_event_stream_header_value_pair}), headers, header)
end

"""
    aws_event_stream_add_bool_header_by_cursor(headers, name, value)

Adds a boolean-valued header to a header list

# Arguments
* `headers`: header list to add to
* `name`: name of the header to add
* `value`: value of the header to add
# Returns
AWS\\_OP\\_SUCCESS on success, AWS\\_OP\\_ERR on failure
### Prototype
```c
int aws_event_stream_add_bool_header_by_cursor( struct aws_array_list *headers, struct aws_byte_cursor name, bool value);
```
"""
function aws_event_stream_add_bool_header_by_cursor(headers, name, value)
    ccall((:aws_event_stream_add_bool_header_by_cursor, libaws_c_event_stream), Cint, (Ptr{Cvoid}, aws_byte_cursor, Bool), headers, name, value)
end

"""
    aws_event_stream_add_byte_header_by_cursor(headers, name, value)

Adds a byte-valued header to a header list

# Arguments
* `headers`: header list to add to
* `name`: name of the header to add
* `value`: value of the header to add
# Returns
AWS\\_OP\\_SUCCESS on success, AWS\\_OP\\_ERR on failure
### Prototype
```c
int aws_event_stream_add_byte_header_by_cursor( struct aws_array_list *headers, struct aws_byte_cursor name, int8_t value);
```
"""
function aws_event_stream_add_byte_header_by_cursor(headers, name, value)
    ccall((:aws_event_stream_add_byte_header_by_cursor, libaws_c_event_stream), Cint, (Ptr{Cvoid}, aws_byte_cursor, Int8), headers, name, value)
end

"""
    aws_event_stream_add_int16_header_by_cursor(headers, name, value)

Adds a int16-valued header to a header list

# Arguments
* `headers`: header list to add to
* `name`: name of the header to add
* `value`: value of the header to add
# Returns
AWS\\_OP\\_SUCCESS on success, AWS\\_OP\\_ERR on failure
### Prototype
```c
int aws_event_stream_add_int16_header_by_cursor( struct aws_array_list *headers, struct aws_byte_cursor name, int16_t value);
```
"""
function aws_event_stream_add_int16_header_by_cursor(headers, name, value)
    ccall((:aws_event_stream_add_int16_header_by_cursor, libaws_c_event_stream), Cint, (Ptr{Cvoid}, aws_byte_cursor, Int16), headers, name, value)
end

"""
    aws_event_stream_add_int32_header_by_cursor(headers, name, value)

Adds a int32-valued header to a header list

# Arguments
* `headers`: header list to add to
* `name`: name of the header to add
* `value`: value of the header to add
# Returns
AWS\\_OP\\_SUCCESS on success, AWS\\_OP\\_ERR on failure
### Prototype
```c
int aws_event_stream_add_int32_header_by_cursor( struct aws_array_list *headers, struct aws_byte_cursor name, int32_t value);
```
"""
function aws_event_stream_add_int32_header_by_cursor(headers, name, value)
    ccall((:aws_event_stream_add_int32_header_by_cursor, libaws_c_event_stream), Cint, (Ptr{Cvoid}, aws_byte_cursor, Int32), headers, name, value)
end

"""
    aws_event_stream_add_int64_header_by_cursor(headers, name, value)

Adds a int64-valued header to a header list

# Arguments
* `headers`: header list to add to
* `name`: name of the header to add
* `value`: value of the header to add
# Returns
AWS\\_OP\\_SUCCESS on success, AWS\\_OP\\_ERR on failure
### Prototype
```c
int aws_event_stream_add_int64_header_by_cursor( struct aws_array_list *headers, struct aws_byte_cursor name, int64_t value);
```
"""
function aws_event_stream_add_int64_header_by_cursor(headers, name, value)
    ccall((:aws_event_stream_add_int64_header_by_cursor, libaws_c_event_stream), Cint, (Ptr{Cvoid}, aws_byte_cursor, Int64), headers, name, value)
end

"""
    aws_event_stream_add_string_header_by_cursor(headers, name, value)

Adds a string-valued header to a header list

# Arguments
* `headers`: header list to add to
* `name`: name of the header to add
* `value`: value of the header to add
# Returns
AWS\\_OP\\_SUCCESS on success, AWS\\_OP\\_ERR on failure
### Prototype
```c
int aws_event_stream_add_string_header_by_cursor( struct aws_array_list *headers, struct aws_byte_cursor name, struct aws_byte_cursor value);
```
"""
function aws_event_stream_add_string_header_by_cursor(headers, name, value)
    ccall((:aws_event_stream_add_string_header_by_cursor, libaws_c_event_stream), Cint, (Ptr{Cvoid}, aws_byte_cursor, aws_byte_cursor), headers, name, value)
end

"""
    aws_event_stream_add_byte_buf_header_by_cursor(headers, name, value)

Adds a byte\\_buf-valued header to a header list

# Arguments
* `headers`: header list to add to
* `name`: name of the header to add
* `value`: value of the header to add
# Returns
AWS\\_OP\\_SUCCESS on success, AWS\\_OP\\_ERR on failure
### Prototype
```c
int aws_event_stream_add_byte_buf_header_by_cursor( struct aws_array_list *headers, struct aws_byte_cursor name, struct aws_byte_cursor value);
```
"""
function aws_event_stream_add_byte_buf_header_by_cursor(headers, name, value)
    ccall((:aws_event_stream_add_byte_buf_header_by_cursor, libaws_c_event_stream), Cint, (Ptr{Cvoid}, aws_byte_cursor, aws_byte_cursor), headers, name, value)
end

"""
    aws_event_stream_add_timestamp_header_by_cursor(headers, name, value)

Adds a timestamp-valued header to a header list

# Arguments
* `headers`: header list to add to
* `name`: name of the header to add
* `value`: value of the header to add
# Returns
AWS\\_OP\\_SUCCESS on success, AWS\\_OP\\_ERR on failure
### Prototype
```c
int aws_event_stream_add_timestamp_header_by_cursor( struct aws_array_list *headers, struct aws_byte_cursor name, int64_t value);
```
"""
function aws_event_stream_add_timestamp_header_by_cursor(headers, name, value)
    ccall((:aws_event_stream_add_timestamp_header_by_cursor, libaws_c_event_stream), Cint, (Ptr{Cvoid}, aws_byte_cursor, Int64), headers, name, value)
end

"""
    aws_event_stream_add_uuid_header_by_cursor(headers, name, value)

Adds a uuid-valued header to a header list

# Arguments
* `headers`: header list to add to
* `name`: name of the header to add
* `value`: value of the header to add
# Returns
AWS\\_OP\\_SUCCESS on success, AWS\\_OP\\_ERR on failure
### Prototype
```c
int aws_event_stream_add_uuid_header_by_cursor( struct aws_array_list *headers, struct aws_byte_cursor name, struct aws_byte_cursor value);
```
"""
function aws_event_stream_add_uuid_header_by_cursor(headers, name, value)
    ccall((:aws_event_stream_add_uuid_header_by_cursor, libaws_c_event_stream), Cint, (Ptr{Cvoid}, aws_byte_cursor, aws_byte_cursor), headers, name, value)
end

"""
    aws_event_stream_header_name(header)

Returns the header name. Note: this value is not null terminated

### Prototype
```c
struct aws_byte_buf aws_event_stream_header_name( struct aws_event_stream_header_value_pair *header);
```
"""
function aws_event_stream_header_name(header)
    ccall((:aws_event_stream_header_name, libaws_c_event_stream), aws_byte_buf, (Ptr{aws_event_stream_header_value_pair},), header)
end

"""
    aws_event_stream_header_value_as_string(header)

Returns the header value as a string. Note: this value is not null terminated.

### Prototype
```c
struct aws_byte_buf aws_event_stream_header_value_as_string( struct aws_event_stream_header_value_pair *header);
```
"""
function aws_event_stream_header_value_as_string(header)
    ccall((:aws_event_stream_header_value_as_string, libaws_c_event_stream), aws_byte_buf, (Ptr{aws_event_stream_header_value_pair},), header)
end

"""
    aws_event_stream_header_value_as_byte(header)

Returns the header value as a byte

### Prototype
```c
int8_t aws_event_stream_header_value_as_byte(struct aws_event_stream_header_value_pair *header);
```
"""
function aws_event_stream_header_value_as_byte(header)
    ccall((:aws_event_stream_header_value_as_byte, libaws_c_event_stream), Int8, (Ptr{aws_event_stream_header_value_pair},), header)
end

"""
    aws_event_stream_header_value_as_bool(header)

Returns the header value as a boolean value.

### Prototype
```c
int8_t aws_event_stream_header_value_as_bool(struct aws_event_stream_header_value_pair *header);
```
"""
function aws_event_stream_header_value_as_bool(header)
    ccall((:aws_event_stream_header_value_as_bool, libaws_c_event_stream), Int8, (Ptr{aws_event_stream_header_value_pair},), header)
end

"""
    aws_event_stream_header_value_as_int16(header)

Returns the header value as a 16 bit integer.

### Prototype
```c
int16_t aws_event_stream_header_value_as_int16(struct aws_event_stream_header_value_pair *header);
```
"""
function aws_event_stream_header_value_as_int16(header)
    ccall((:aws_event_stream_header_value_as_int16, libaws_c_event_stream), Int16, (Ptr{aws_event_stream_header_value_pair},), header)
end

"""
    aws_event_stream_header_value_as_int32(header)

Returns the header value as a 32 bit integer.

### Prototype
```c
int32_t aws_event_stream_header_value_as_int32(struct aws_event_stream_header_value_pair *header);
```
"""
function aws_event_stream_header_value_as_int32(header)
    ccall((:aws_event_stream_header_value_as_int32, libaws_c_event_stream), Int32, (Ptr{aws_event_stream_header_value_pair},), header)
end

"""
    aws_event_stream_header_value_as_int64(header)

Returns the header value as a 64 bit integer.

### Prototype
```c
int64_t aws_event_stream_header_value_as_int64(struct aws_event_stream_header_value_pair *header);
```
"""
function aws_event_stream_header_value_as_int64(header)
    ccall((:aws_event_stream_header_value_as_int64, libaws_c_event_stream), Int64, (Ptr{aws_event_stream_header_value_pair},), header)
end

"""
    aws_event_stream_header_value_as_bytebuf(header)

Returns the header value as a pointer to a byte buffer, call [`aws_event_stream_header_value_length`](@ref) to determine the length of the buffer.

### Prototype
```c
struct aws_byte_buf aws_event_stream_header_value_as_bytebuf( struct aws_event_stream_header_value_pair *header);
```
"""
function aws_event_stream_header_value_as_bytebuf(header)
    ccall((:aws_event_stream_header_value_as_bytebuf, libaws_c_event_stream), aws_byte_buf, (Ptr{aws_event_stream_header_value_pair},), header)
end

"""
    aws_event_stream_header_value_as_timestamp(header)

Returns the header value as a 64 bit integer representing milliseconds since unix epoch.

### Prototype
```c
int64_t aws_event_stream_header_value_as_timestamp(struct aws_event_stream_header_value_pair *header);
```
"""
function aws_event_stream_header_value_as_timestamp(header)
    ccall((:aws_event_stream_header_value_as_timestamp, libaws_c_event_stream), Int64, (Ptr{aws_event_stream_header_value_pair},), header)
end

"""
    aws_event_stream_header_value_as_uuid(header)

Returns the header value a byte buffer which is 16 bytes long. Represents a UUID.

### Prototype
```c
struct aws_byte_buf aws_event_stream_header_value_as_uuid( struct aws_event_stream_header_value_pair *header);
```
"""
function aws_event_stream_header_value_as_uuid(header)
    ccall((:aws_event_stream_header_value_as_uuid, libaws_c_event_stream), aws_byte_buf, (Ptr{aws_event_stream_header_value_pair},), header)
end

"""
    aws_event_stream_header_value_length(header)

Returns the length of the header value buffer. This is mostly intended for string and byte buffer types.

### Prototype
```c
uint16_t aws_event_stream_header_value_length(struct aws_event_stream_header_value_pair *header);
```
"""
function aws_event_stream_header_value_length(header)
    ccall((:aws_event_stream_header_value_length, libaws_c_event_stream), UInt16, (Ptr{aws_event_stream_header_value_pair},), header)
end

"""
    aws_event_stream_streaming_decoder_pump(decoder, data)

The main driver of the decoder. Pass data that should be decoded with its length. A likely use-case here is in response to a read event from an io-device

### Prototype
```c
int aws_event_stream_streaming_decoder_pump( struct aws_event_stream_streaming_decoder *decoder, const struct aws_byte_buf *data);
```
"""
function aws_event_stream_streaming_decoder_pump(decoder, data)
    ccall((:aws_event_stream_streaming_decoder_pump, libaws_c_event_stream), Cint, (Ptr{aws_event_stream_streaming_decoder}, Ptr{aws_byte_buf}), decoder, data)
end

"""
    aws_event_stream_library_init(allocator)

Initializes internal datastructures used by aws-c-event-stream. Must be called before using any functionality in aws-c-event-stream.

### Prototype
```c
void aws_event_stream_library_init(struct aws_allocator *allocator);
```
"""
function aws_event_stream_library_init(allocator)
    ccall((:aws_event_stream_library_init, libaws_c_event_stream), Cvoid, (Ptr{aws_allocator},), allocator)
end

"""
    aws_event_stream_library_clean_up()

Clean up internal datastructures used by aws-c-event-stream. Must not be called until application is done using functionality in aws-c-event-stream.

### Prototype
```c
void aws_event_stream_library_clean_up(void);
```
"""
function aws_event_stream_library_clean_up()
    ccall((:aws_event_stream_library_clean_up, libaws_c_event_stream), Cvoid, ())
end

"""
Documentation not found.
"""
mutable struct aws_event_stream_channel_handler end

# typedef void ( aws_event_stream_channel_handler_on_message_received_fn ) ( struct aws_event_stream_message * message , int error_code , void * user_data )
"""
Invoked when an [`aws_event_stream_message`](@ref) is encountered. If the message parsed successfully, message will be non-null and error\\_code will be AWS\\_ERROR\\_SUCCESS. Otherwise message will be null and error\\_code will represent the error that was encountered. Note that any case that error\\_code was not AWS\\_OP\\_SUCCESS, the channel also shuts down.
"""
const aws_event_stream_channel_handler_on_message_received_fn = Cvoid

# typedef void ( aws_event_stream_channel_handler_on_message_written_fn ) ( struct aws_event_stream_message * message , int error_code , void * user_data )
"""
Invoked when an [`aws_event_stream_message`](@ref) is flushed to the IO interface. When error\\_code is AWS\\_ERROR\\_SUCCESS the write happened successfuly. Regardless, message is held from the [`aws_event_stream_channel_handler_write_message`](@ref)() call and should likely be freed in this callback. If error\\_code is non-zero, the channel will be shutdown immediately after this callback returns.
"""
const aws_event_stream_channel_handler_on_message_written_fn = Cvoid

"""
    aws_event_stream_channel_handler_options

Documentation not found.
"""
struct aws_event_stream_channel_handler_options
    on_message_received::Ptr{aws_event_stream_channel_handler_on_message_received_fn}
    user_data::Ptr{Cvoid}
    initial_window_size::Csize_t
    manual_window_management::Bool
end

"""
    aws_event_stream_channel_handler_new(allocator, handler_options)

Allocates and initializes a new channel handler for processing [`aws_event_stream_message`](@ref)() events. Handler options must not be null.

### Prototype
```c
struct aws_channel_handler *aws_event_stream_channel_handler_new( struct aws_allocator *allocator, const struct aws_event_stream_channel_handler_options *handler_options);
```
"""
function aws_event_stream_channel_handler_new(allocator, handler_options)
    ccall((:aws_event_stream_channel_handler_new, libaws_c_event_stream), Ptr{aws_channel_handler}, (Ptr{aws_allocator}, Ptr{aws_event_stream_channel_handler_options}), allocator, handler_options)
end

"""
    aws_event_stream_channel_handler_write_message(handler, message, on_message_written, user_data)

Writes an [`aws_event_stream_message`](@ref)() to the channel. Once the channel flushes or an error occurs, on\\_message\\_written will be invoked. message should stay valid until the callback is invoked. If an error an occurs, the channel will automatically be shutdown.

### Prototype
```c
int aws_event_stream_channel_handler_write_message( struct aws_channel_handler *handler, struct aws_event_stream_message *message, aws_event_stream_channel_handler_on_message_written_fn *on_message_written, void *user_data);
```
"""
function aws_event_stream_channel_handler_write_message(handler, message, on_message_written, user_data)
    ccall((:aws_event_stream_channel_handler_write_message, libaws_c_event_stream), Cint, (Ptr{aws_channel_handler}, Ptr{aws_event_stream_message}, Ptr{aws_event_stream_channel_handler_on_message_written_fn}, Ptr{Cvoid}), handler, message, on_message_written, user_data)
end

"""
    aws_event_stream_channel_handler_increment_read_window(handler, window_update_size)

Updates the read window for the channel if automatic\\_window\\_managemanet was set to false.

### Prototype
```c
void aws_event_stream_channel_handler_increment_read_window( struct aws_channel_handler *handler, size_t window_update_size);
```
"""
function aws_event_stream_channel_handler_increment_read_window(handler, window_update_size)
    ccall((:aws_event_stream_channel_handler_increment_read_window, libaws_c_event_stream), Cvoid, (Ptr{aws_channel_handler}, Csize_t), handler, window_update_size)
end

"""
    aws_event_stream_channel_handler_get_user_data(handler)

Documentation not found.
### Prototype
```c
void *aws_event_stream_channel_handler_get_user_data(struct aws_channel_handler *handler);
```
"""
function aws_event_stream_channel_handler_get_user_data(handler)
    ccall((:aws_event_stream_channel_handler_get_user_data, libaws_c_event_stream), Ptr{Cvoid}, (Ptr{aws_channel_handler},), handler)
end

"""
    aws_event_stream_rpc_message_type

Documentation not found.
"""
@cenum aws_event_stream_rpc_message_type::UInt32 begin
    AWS_EVENT_STREAM_RPC_MESSAGE_TYPE_APPLICATION_MESSAGE = 0
    AWS_EVENT_STREAM_RPC_MESSAGE_TYPE_APPLICATION_ERROR = 1
    AWS_EVENT_STREAM_RPC_MESSAGE_TYPE_PING = 2
    AWS_EVENT_STREAM_RPC_MESSAGE_TYPE_PING_RESPONSE = 3
    AWS_EVENT_STREAM_RPC_MESSAGE_TYPE_CONNECT = 4
    AWS_EVENT_STREAM_RPC_MESSAGE_TYPE_CONNECT_ACK = 5
    AWS_EVENT_STREAM_RPC_MESSAGE_TYPE_PROTOCOL_ERROR = 6
    AWS_EVENT_STREAM_RPC_MESSAGE_TYPE_INTERNAL_ERROR = 7
    AWS_EVENT_STREAM_RPC_MESSAGE_TYPE_COUNT = 8
end

"""
    aws_event_stream_rpc_message_flag

Documentation not found.
"""
@cenum aws_event_stream_rpc_message_flag::UInt32 begin
    AWS_EVENT_STREAM_RPC_MESSAGE_FLAG_CONNECTION_ACCEPTED = 1
    AWS_EVENT_STREAM_RPC_MESSAGE_FLAG_TERMINATE_STREAM = 2
end

"""
    aws_event_stream_rpc_message_args

Documentation not found.
"""
struct aws_event_stream_rpc_message_args
    headers::Ptr{aws_event_stream_header_value_pair}
    headers_count::Csize_t
    payload::Ptr{aws_byte_buf}
    message_type::aws_event_stream_rpc_message_type
    message_flags::UInt32
end

"""
Documentation not found.
"""
mutable struct aws_event_stream_rpc_client_connection end

"""
Documentation not found.
"""
mutable struct aws_event_stream_rpc_client_continuation_token end

# typedef void ( aws_event_stream_rpc_client_stream_continuation_fn ) ( struct aws_event_stream_rpc_client_continuation_token * token , const struct aws_event_stream_rpc_message_args * message_args , void * user_data )
"""
Invoked when a connection receives a message on an existing stream. message\\_args contains the message data.
"""
const aws_event_stream_rpc_client_stream_continuation_fn = Cvoid

# typedef void ( aws_event_stream_rpc_client_stream_continuation_closed_fn ) ( struct aws_event_stream_rpc_client_continuation_token * token , void * user_data )
"""
Invoked when a continuation has either been closed with the TERMINATE\\_STREAM flag, or when the connection shuts down and deletes the continuation.
"""
const aws_event_stream_rpc_client_stream_continuation_closed_fn = Cvoid

# typedef void ( aws_event_stream_rpc_client_stream_continuation_terminated_fn ) ( void * user_data )
"""
Invoked after a continuation has been fully destroyed. Listeners know that no further callbacks are possible.
"""
const aws_event_stream_rpc_client_stream_continuation_terminated_fn = Cvoid

"""
    aws_event_stream_rpc_client_stream_continuation_options

Documentation not found.
"""
struct aws_event_stream_rpc_client_stream_continuation_options
    on_continuation::Ptr{aws_event_stream_rpc_client_stream_continuation_fn}
    on_continuation_closed::Ptr{aws_event_stream_rpc_client_stream_continuation_closed_fn}
    on_continuation_terminated::Ptr{aws_event_stream_rpc_client_stream_continuation_terminated_fn}
    user_data::Ptr{Cvoid}
end

# typedef void ( aws_event_stream_rpc_client_connection_protocol_message_fn ) ( struct aws_event_stream_rpc_client_connection * connection , const struct aws_event_stream_rpc_message_args * message_args , void * user_data )
"""
Invoked when a non-stream level message is received on a connection.
"""
const aws_event_stream_rpc_client_connection_protocol_message_fn = Cvoid

# typedef void ( aws_event_stream_rpc_client_on_connection_shutdown_fn ) ( struct aws_event_stream_rpc_client_connection * connection , int error_code , void * user_data )
"""
Invoked when a successfully created connection is shutdown. error\\_code will indicate the reason for the shutdown.
"""
const aws_event_stream_rpc_client_on_connection_shutdown_fn = Cvoid

# typedef void ( aws_event_stream_rpc_client_on_connection_setup_fn ) ( struct aws_event_stream_rpc_client_connection * connection , int error_code , void * user_data )
"""
Invoked when a connection attempt completes.

If the attempt was unsuccessful, the error\\_code will be non-zero and the connection pointer will be NULL, and [`aws_event_stream_rpc_client_on_connection_shutdown_fn`](@ref) will not be invoked.

If the attempt was successful, error\\_code will be 0 and the connection pointer will be valid. You must call [`aws_event_stream_rpc_client_connection_acquire`](@ref)() to prevent the pointer's memory from being destroyed before you are ready. When you are completely done with the connection pointer you must call [`aws_event_stream_rpc_client_connection_release`](@ref)() or its memory will leak. [`aws_event_stream_rpc_client_on_connection_shutdown_fn`](@ref) will be invoked when the network connection has closed. If you are done with the connection, but it is still open, you must call aws\\_aws\\_event\\_stream\\_rpc\\_client\\_close() or network connection will remain open, even if you call release().
"""
const aws_event_stream_rpc_client_on_connection_setup_fn = Cvoid

# typedef void ( aws_event_stream_rpc_client_on_connection_terminated_fn ) ( void * user_data )
"""
Invoked when a connection has been completely destroyed.
"""
const aws_event_stream_rpc_client_on_connection_terminated_fn = Cvoid

# typedef void ( aws_event_stream_rpc_client_message_flush_fn ) ( int error_code , void * user_data )
"""
Invoked whenever a message has been flushed to the channel.
"""
const aws_event_stream_rpc_client_message_flush_fn = Cvoid

"""
    aws_event_stream_rpc_client_connection_options

Documentation not found.
"""
struct aws_event_stream_rpc_client_connection_options
    host_name::Ptr{Cchar}
    port::UInt32
    socket_options::Ptr{aws_socket_options}
    tls_options::Ptr{aws_tls_connection_options}
    bootstrap::Ptr{aws_client_bootstrap}
    on_connection_setup::Ptr{aws_event_stream_rpc_client_on_connection_setup_fn}
    on_connection_protocol_message::Ptr{aws_event_stream_rpc_client_connection_protocol_message_fn}
    on_connection_shutdown::Ptr{aws_event_stream_rpc_client_on_connection_shutdown_fn}
    on_connection_terminated::Ptr{aws_event_stream_rpc_client_on_connection_terminated_fn}
    user_data::Ptr{Cvoid}
end

"""
    aws_event_stream_rpc_client_connection_connect(allocator, conn_options)

Initiate a new connection. If this function returns AWS\\_OP\\_SUCESSS, the [`aws_event_stream_rpc_client_connection_options`](@ref)::on\\_connection\\_setup is guaranteed to be called exactly once. If that callback successfully creates a connection, [`aws_event_stream_rpc_client_connection_options`](@ref)::on\\_connection\\_shutdown will be invoked upon connection closure. However if the connection was never successfully setup, [`aws_event_stream_rpc_client_connection_options`](@ref)::on\\_connection\\_shutdown will not be invoked later.

### Prototype
```c
int aws_event_stream_rpc_client_connection_connect( struct aws_allocator *allocator, const struct aws_event_stream_rpc_client_connection_options *conn_options);
```
"""
function aws_event_stream_rpc_client_connection_connect(allocator, conn_options)
    ccall((:aws_event_stream_rpc_client_connection_connect, libaws_c_event_stream), Cint, (Ptr{aws_allocator}, Ptr{aws_event_stream_rpc_client_connection_options}), allocator, conn_options)
end

"""
    aws_event_stream_rpc_client_connection_acquire(connection)

Documentation not found.
### Prototype
```c
void aws_event_stream_rpc_client_connection_acquire( const struct aws_event_stream_rpc_client_connection *connection);
```
"""
function aws_event_stream_rpc_client_connection_acquire(connection)
    ccall((:aws_event_stream_rpc_client_connection_acquire, libaws_c_event_stream), Cvoid, (Ptr{aws_event_stream_rpc_client_connection},), connection)
end

"""
    aws_event_stream_rpc_client_connection_release(connection)

Documentation not found.
### Prototype
```c
void aws_event_stream_rpc_client_connection_release( const struct aws_event_stream_rpc_client_connection *connection);
```
"""
function aws_event_stream_rpc_client_connection_release(connection)
    ccall((:aws_event_stream_rpc_client_connection_release, libaws_c_event_stream), Cvoid, (Ptr{aws_event_stream_rpc_client_connection},), connection)
end

"""
    aws_event_stream_rpc_client_connection_close(connection, shutdown_error_code)

Closes the connection if it is open and [`aws_event_stream_rpc_client_connection_options`](@ref)::on\\_connection\\_shutdown will be invoked upon shutdown. shutdown\\_error\\_code will indicate the reason for shutdown. For a graceful shutdown pass 0 or AWS\\_ERROR\\_SUCCESS.

### Prototype
```c
void aws_event_stream_rpc_client_connection_close( struct aws_event_stream_rpc_client_connection *connection, int shutdown_error_code);
```
"""
function aws_event_stream_rpc_client_connection_close(connection, shutdown_error_code)
    ccall((:aws_event_stream_rpc_client_connection_close, libaws_c_event_stream), Cvoid, (Ptr{aws_event_stream_rpc_client_connection}, Cint), connection, shutdown_error_code)
end

"""
    aws_event_stream_rpc_client_connection_is_open(connection)

Returns true if the connection is open, false otherwise.

### Prototype
```c
bool aws_event_stream_rpc_client_connection_is_open( const struct aws_event_stream_rpc_client_connection *connection);
```
"""
function aws_event_stream_rpc_client_connection_is_open(connection)
    ccall((:aws_event_stream_rpc_client_connection_is_open, libaws_c_event_stream), Bool, (Ptr{aws_event_stream_rpc_client_connection},), connection)
end

"""
    aws_event_stream_rpc_client_connection_send_protocol_message(connection, message_args, flush_fn, user_data)

Sends a message on the connection. These must be connection level messages (not application messages).

flush\\_fn will be invoked when the message has been successfully writen to the wire or when it fails.

returns AWS\\_OP\\_SUCCESS if the message was successfully created and queued, and in that case flush\\_fn will always be invoked. Otherwise, flush\\_fn will not be invoked.

### Prototype
```c
int aws_event_stream_rpc_client_connection_send_protocol_message( struct aws_event_stream_rpc_client_connection *connection, const struct aws_event_stream_rpc_message_args *message_args, aws_event_stream_rpc_client_message_flush_fn *flush_fn, void *user_data);
```
"""
function aws_event_stream_rpc_client_connection_send_protocol_message(connection, message_args, flush_fn, user_data)
    ccall((:aws_event_stream_rpc_client_connection_send_protocol_message, libaws_c_event_stream), Cint, (Ptr{aws_event_stream_rpc_client_connection}, Ptr{aws_event_stream_rpc_message_args}, Ptr{aws_event_stream_rpc_client_message_flush_fn}, Ptr{Cvoid}), connection, message_args, flush_fn, user_data)
end

"""
    aws_event_stream_rpc_client_connection_get_event_loop(connection)

Returns the event loop that a connection is seated on.

### Prototype
```c
struct aws_event_loop *aws_event_stream_rpc_client_connection_get_event_loop( const struct aws_event_stream_rpc_client_connection *connection);
```
"""
function aws_event_stream_rpc_client_connection_get_event_loop(connection)
    ccall((:aws_event_stream_rpc_client_connection_get_event_loop, libaws_c_event_stream), Ptr{aws_event_loop}, (Ptr{aws_event_stream_rpc_client_connection},), connection)
end

"""
    aws_event_stream_rpc_client_connection_new_stream(connection, continuation_options)

Create a new stream. continuation\\_option's callbacks will not be invoked, and nothing will be sent across the wire until [`aws_event_stream_rpc_client_continuation_activate`](@ref)() is invoked.

returns an instance of a [`aws_event_stream_rpc_client_continuation_token`](@ref) on success with a reference count of 1. You must call [`aws_event_stream_rpc_client_continuation_release`](@ref)() when you're finished with it. Returns NULL on failure.

### Prototype
```c
struct aws_event_stream_rpc_client_continuation_token * aws_event_stream_rpc_client_connection_new_stream( struct aws_event_stream_rpc_client_connection *connection, const struct aws_event_stream_rpc_client_stream_continuation_options *continuation_options);
```
"""
function aws_event_stream_rpc_client_connection_new_stream(connection, continuation_options)
    ccall((:aws_event_stream_rpc_client_connection_new_stream, libaws_c_event_stream), Ptr{aws_event_stream_rpc_client_continuation_token}, (Ptr{aws_event_stream_rpc_client_connection}, Ptr{aws_event_stream_rpc_client_stream_continuation_options}), connection, continuation_options)
end

"""
    aws_event_stream_rpc_client_continuation_acquire(continuation)

Documentation not found.
### Prototype
```c
void aws_event_stream_rpc_client_continuation_acquire( const struct aws_event_stream_rpc_client_continuation_token *continuation);
```
"""
function aws_event_stream_rpc_client_continuation_acquire(continuation)
    ccall((:aws_event_stream_rpc_client_continuation_acquire, libaws_c_event_stream), Cvoid, (Ptr{aws_event_stream_rpc_client_continuation_token},), continuation)
end

"""
    aws_event_stream_rpc_client_continuation_release(continuation)

Documentation not found.
### Prototype
```c
void aws_event_stream_rpc_client_continuation_release( const struct aws_event_stream_rpc_client_continuation_token *continuation);
```
"""
function aws_event_stream_rpc_client_continuation_release(continuation)
    ccall((:aws_event_stream_rpc_client_continuation_release, libaws_c_event_stream), Cvoid, (Ptr{aws_event_stream_rpc_client_continuation_token},), continuation)
end

"""
    aws_event_stream_rpc_client_continuation_is_closed(continuation)

returns true if the continuation has been closed.

### Prototype
```c
bool aws_event_stream_rpc_client_continuation_is_closed( const struct aws_event_stream_rpc_client_continuation_token *continuation);
```
"""
function aws_event_stream_rpc_client_continuation_is_closed(continuation)
    ccall((:aws_event_stream_rpc_client_continuation_is_closed, libaws_c_event_stream), Bool, (Ptr{aws_event_stream_rpc_client_continuation_token},), continuation)
end

"""
    aws_event_stream_rpc_client_continuation_activate(continuation, operation_name, message_args, flush_fn, user_data)

Actually sends the initial stream to the peer. Callbacks from [`aws_event_stream_rpc_client_connection_new_stream`](@ref)() will actually be invoked if this function returns AWS\\_OP\\_SUCCESS, otherwise, the stream has not been queued and no callbacks will be invoked.

operation\\_name is the name to identify which logical rpc call you want to kick off with the peer. It must be non-empty. flush\\_fn will be invoked once the message has either been written to the wire or it fails.

### Prototype
```c
int aws_event_stream_rpc_client_continuation_activate( struct aws_event_stream_rpc_client_continuation_token *continuation, struct aws_byte_cursor operation_name, const struct aws_event_stream_rpc_message_args *message_args, aws_event_stream_rpc_client_message_flush_fn *flush_fn, void *user_data);
```
"""
function aws_event_stream_rpc_client_continuation_activate(continuation, operation_name, message_args, flush_fn, user_data)
    ccall((:aws_event_stream_rpc_client_continuation_activate, libaws_c_event_stream), Cint, (Ptr{aws_event_stream_rpc_client_continuation_token}, aws_byte_cursor, Ptr{aws_event_stream_rpc_message_args}, Ptr{aws_event_stream_rpc_client_message_flush_fn}, Ptr{Cvoid}), continuation, operation_name, message_args, flush_fn, user_data)
end

"""
    aws_event_stream_rpc_client_continuation_get_user_data(continuation)

Documentation not found.
### Prototype
```c
void *aws_event_stream_rpc_client_continuation_get_user_data( struct aws_event_stream_rpc_client_continuation_token *continuation);
```
"""
function aws_event_stream_rpc_client_continuation_get_user_data(continuation)
    ccall((:aws_event_stream_rpc_client_continuation_get_user_data, libaws_c_event_stream), Ptr{Cvoid}, (Ptr{aws_event_stream_rpc_client_continuation_token},), continuation)
end

"""
    aws_event_stream_rpc_client_continuation_send_message(continuation, message_args, flush_fn, user_data)

Sends a message on the continuation. [`aws_event_stream_rpc_client_continuation_activate`](@ref)() must be successfully invoked prior to calling this function.

If this function returns AWS\\_OP\\_SUCCESS, flush\\_fn will be invoked once the message has either been written to the wire or it fails.

### Prototype
```c
int aws_event_stream_rpc_client_continuation_send_message( struct aws_event_stream_rpc_client_continuation_token *continuation, const struct aws_event_stream_rpc_message_args *message_args, aws_event_stream_rpc_client_message_flush_fn *flush_fn, void *user_data);
```
"""
function aws_event_stream_rpc_client_continuation_send_message(continuation, message_args, flush_fn, user_data)
    ccall((:aws_event_stream_rpc_client_continuation_send_message, libaws_c_event_stream), Cint, (Ptr{aws_event_stream_rpc_client_continuation_token}, Ptr{aws_event_stream_rpc_message_args}, Ptr{aws_event_stream_rpc_client_message_flush_fn}, Ptr{Cvoid}), continuation, message_args, flush_fn, user_data)
end

"""
Documentation not found.
"""
mutable struct aws_event_stream_rpc_server_connection end

"""
Documentation not found.
"""
mutable struct aws_event_stream_rpc_server_continuation_token end

# typedef void ( aws_event_stream_rpc_server_stream_continuation_fn ) ( struct aws_event_stream_rpc_server_continuation_token * token , const struct aws_event_stream_rpc_message_args * message_args , void * user_data )
"""
Invoked when a connection receives a message on an existing stream. message\\_args contains the message data.
"""
const aws_event_stream_rpc_server_stream_continuation_fn = Cvoid

# typedef void ( aws_event_stream_rpc_server_stream_continuation_closed_fn ) ( struct aws_event_stream_rpc_server_continuation_token * token , void * user_data )
"""
Invoked when a continuation has either been closed with the TERMINATE\\_STREAM flag, or when the connection shutsdown and deletes the continuation.
"""
const aws_event_stream_rpc_server_stream_continuation_closed_fn = Cvoid

"""
    aws_event_stream_rpc_server_stream_continuation_options

Documentation not found.
"""
struct aws_event_stream_rpc_server_stream_continuation_options
    on_continuation::Ptr{aws_event_stream_rpc_server_stream_continuation_fn}
    on_continuation_closed::Ptr{aws_event_stream_rpc_server_stream_continuation_closed_fn}
    user_data::Ptr{Cvoid}
end

# typedef void ( aws_event_stream_rpc_server_connection_protocol_message_fn ) ( struct aws_event_stream_rpc_server_connection * connection , const struct aws_event_stream_rpc_message_args * message_args , void * user_data )
"""
Invoked when a non-stream level message is received on a connection.
"""
const aws_event_stream_rpc_server_connection_protocol_message_fn = Cvoid

# typedef int ( aws_event_stream_rpc_server_on_incoming_stream_fn ) ( struct aws_event_stream_rpc_server_connection * connection , struct aws_event_stream_rpc_server_continuation_token * token , struct aws_byte_cursor operation_name , struct aws_event_stream_rpc_server_stream_continuation_options * continuation_options , void * user_data )
"""
Invoked when a new stream has been received on the connection. If you return AWS\\_OP\\_SUCCESS (0), You must fill in the fields for continuation options or the program will assert and exit.

A failure path MUST leave the ref count of the continuation alone.

A success path should probably take a ref which will leave the continuation (assuming no other interference) at two AFTER creation is complete: 1 for the connection's continuation table, and one for the callback recipient which is presumably tracking it as well.
"""
const aws_event_stream_rpc_server_on_incoming_stream_fn = Cvoid

"""
    aws_event_stream_rpc_connection_options

Documentation not found.
"""
struct aws_event_stream_rpc_connection_options
    on_incoming_stream::Ptr{aws_event_stream_rpc_server_on_incoming_stream_fn}
    on_connection_protocol_message::Ptr{aws_event_stream_rpc_server_connection_protocol_message_fn}
    user_data::Ptr{Cvoid}
end

# typedef int ( aws_event_stream_rpc_server_on_new_connection_fn ) ( struct aws_event_stream_rpc_server_connection * connection , int error_code , struct aws_event_stream_rpc_connection_options * connection_options , void * user_data )
"""
Invoked when a new connection is received on a server listener. If you return AWS\\_OP\\_SUCCESS, You must fill in the fields for connection\\_options or the program will assert and exit.

If error\\_code is non-zero, an error occurred upon setting up the channel and connection will be NULL. Otherwise, connection is non-null. If you intend to seat a pointer to connection, you MUST call [`aws_event_stream_rpc_server_connection_acquire`](@ref)() and when you're finished with the connection you MUST call aws\\_event\\_stream\\_server\\_connection\\_release().
"""
const aws_event_stream_rpc_server_on_new_connection_fn = Cvoid

# typedef void ( aws_event_stream_rpc_server_on_connection_shutdown_fn ) ( struct aws_event_stream_rpc_server_connection * connection , int error_code , void * user_data )
"""
Invoked when a successfully created connection is shutdown. error\\_code will indicate the reason for the shutdown.
"""
const aws_event_stream_rpc_server_on_connection_shutdown_fn = Cvoid

# typedef void ( aws_event_stream_rpc_server_message_flush_fn ) ( int error_code , void * user_data )
"""
Invoked whenever a message has been flushed to the channel.
"""
const aws_event_stream_rpc_server_message_flush_fn = Cvoid

"""
Documentation not found.
"""
mutable struct aws_event_stream_rpc_server_listener end

# typedef void ( aws_event_stream_rpc_server_on_listener_destroy_fn ) ( struct aws_event_stream_rpc_server_listener * server , void * user_data )
"""
(Optional). Invoked when the listener has been successfully shutdown (after the last ref count release).
"""
const aws_event_stream_rpc_server_on_listener_destroy_fn = Cvoid

"""
    aws_event_stream_rpc_server_listener_options

Documentation not found.
"""
struct aws_event_stream_rpc_server_listener_options
    host_name::Ptr{Cchar}
    port::UInt32
    socket_options::Ptr{aws_socket_options}
    tls_options::Ptr{aws_tls_connection_options}
    bootstrap::Ptr{aws_server_bootstrap}
    on_new_connection::Ptr{aws_event_stream_rpc_server_on_new_connection_fn}
    on_connection_shutdown::Ptr{aws_event_stream_rpc_server_on_connection_shutdown_fn}
    on_destroy_callback::Ptr{aws_event_stream_rpc_server_on_listener_destroy_fn}
    user_data::Ptr{Cvoid}
end

"""
    aws_event_stream_rpc_server_new_listener(allocator, options)

Creates a listener with a ref count of 1. You are responsible for calling [`aws_event_stream_rpc_server_listener_release`](@ref)() when you're finished with the listener. Returns NULL if an error occurs.

### Prototype
```c
struct aws_event_stream_rpc_server_listener *aws_event_stream_rpc_server_new_listener( struct aws_allocator *allocator, struct aws_event_stream_rpc_server_listener_options *options);
```
"""
function aws_event_stream_rpc_server_new_listener(allocator, options)
    ccall((:aws_event_stream_rpc_server_new_listener, libaws_c_event_stream), Ptr{aws_event_stream_rpc_server_listener}, (Ptr{aws_allocator}, Ptr{aws_event_stream_rpc_server_listener_options}), allocator, options)
end

"""
    aws_event_stream_rpc_server_listener_acquire(listener)

Documentation not found.
### Prototype
```c
void aws_event_stream_rpc_server_listener_acquire( struct aws_event_stream_rpc_server_listener *listener);
```
"""
function aws_event_stream_rpc_server_listener_acquire(listener)
    ccall((:aws_event_stream_rpc_server_listener_acquire, libaws_c_event_stream), Cvoid, (Ptr{aws_event_stream_rpc_server_listener},), listener)
end

"""
    aws_event_stream_rpc_server_listener_release(listener)

Documentation not found.
### Prototype
```c
void aws_event_stream_rpc_server_listener_release( struct aws_event_stream_rpc_server_listener *listener);
```
"""
function aws_event_stream_rpc_server_listener_release(listener)
    ccall((:aws_event_stream_rpc_server_listener_release, libaws_c_event_stream), Cvoid, (Ptr{aws_event_stream_rpc_server_listener},), listener)
end

"""
    aws_event_stream_rpc_server_listener_get_bound_port(listener)

Get the local port which the listener's socket is bound to.

### Prototype
```c
uint32_t aws_event_stream_rpc_server_listener_get_bound_port( const struct aws_event_stream_rpc_server_listener *listener);
```
"""
function aws_event_stream_rpc_server_listener_get_bound_port(listener)
    ccall((:aws_event_stream_rpc_server_listener_get_bound_port, libaws_c_event_stream), UInt32, (Ptr{aws_event_stream_rpc_server_listener},), listener)
end

"""
    aws_event_stream_rpc_server_connection_from_existing_channel(server, channel, connection_options)

Bypasses server, and creates a connection on an already existing channel. No connection lifetime callbacks will be invoked on the returned connection. Returns NULL if an error occurs. If and only if, you use this API, the returned connection is already ref counted and you must call [`aws_event_stream_rpc_server_connection_release`](@ref)() even if you did not explictly call [`aws_event_stream_rpc_server_connection_acquire`](@ref)()

### Prototype
```c
struct aws_event_stream_rpc_server_connection * aws_event_stream_rpc_server_connection_from_existing_channel( struct aws_event_stream_rpc_server_listener *server, struct aws_channel *channel, const struct aws_event_stream_rpc_connection_options *connection_options);
```
"""
function aws_event_stream_rpc_server_connection_from_existing_channel(server, channel, connection_options)
    ccall((:aws_event_stream_rpc_server_connection_from_existing_channel, libaws_c_event_stream), Ptr{aws_event_stream_rpc_server_connection}, (Ptr{aws_event_stream_rpc_server_listener}, Ptr{aws_channel}, Ptr{aws_event_stream_rpc_connection_options}), server, channel, connection_options)
end

"""
    aws_event_stream_rpc_server_connection_acquire(connection)

Documentation not found.
### Prototype
```c
void aws_event_stream_rpc_server_connection_acquire( struct aws_event_stream_rpc_server_connection *connection);
```
"""
function aws_event_stream_rpc_server_connection_acquire(connection)
    ccall((:aws_event_stream_rpc_server_connection_acquire, libaws_c_event_stream), Cvoid, (Ptr{aws_event_stream_rpc_server_connection},), connection)
end

"""
    aws_event_stream_rpc_server_connection_release(connection)

Documentation not found.
### Prototype
```c
void aws_event_stream_rpc_server_connection_release( struct aws_event_stream_rpc_server_connection *connection);
```
"""
function aws_event_stream_rpc_server_connection_release(connection)
    ccall((:aws_event_stream_rpc_server_connection_release, libaws_c_event_stream), Cvoid, (Ptr{aws_event_stream_rpc_server_connection},), connection)
end

"""
    aws_event_stream_rpc_server_connection_get_user_data(connection)

Documentation not found.
### Prototype
```c
void *aws_event_stream_rpc_server_connection_get_user_data( struct aws_event_stream_rpc_server_connection *connection);
```
"""
function aws_event_stream_rpc_server_connection_get_user_data(connection)
    ccall((:aws_event_stream_rpc_server_connection_get_user_data, libaws_c_event_stream), Ptr{Cvoid}, (Ptr{aws_event_stream_rpc_server_connection},), connection)
end

"""
    aws_event_stream_rpc_server_connection_is_open(connection)

returns true if the connection is open. False otherwise.

### Prototype
```c
bool aws_event_stream_rpc_server_connection_is_open( struct aws_event_stream_rpc_server_connection *connection);
```
"""
function aws_event_stream_rpc_server_connection_is_open(connection)
    ccall((:aws_event_stream_rpc_server_connection_is_open, libaws_c_event_stream), Bool, (Ptr{aws_event_stream_rpc_server_connection},), connection)
end

"""
    aws_event_stream_rpc_server_connection_close(connection, shutdown_error_code)

Closes the connection (including all continuations on the connection), and releases the connection ref count. shutdown\\_error\\_code is the error code to use when shutting down the channel. Use AWS\\_ERROR\\_SUCCESS for non-error cases.

### Prototype
```c
void aws_event_stream_rpc_server_connection_close( struct aws_event_stream_rpc_server_connection *connection, int shutdown_error_code);
```
"""
function aws_event_stream_rpc_server_connection_close(connection, shutdown_error_code)
    ccall((:aws_event_stream_rpc_server_connection_close, libaws_c_event_stream), Cvoid, (Ptr{aws_event_stream_rpc_server_connection}, Cint), connection, shutdown_error_code)
end

"""
    aws_event_stream_rpc_server_connection_send_protocol_message(connection, message_args, flush_fn, user_data)

Sends a protocol message on the connection (not application data). If the message is valid and successfully written to the channel, flush\\_fn will be invoked.

### Prototype
```c
int aws_event_stream_rpc_server_connection_send_protocol_message( struct aws_event_stream_rpc_server_connection *connection, const struct aws_event_stream_rpc_message_args *message_args, aws_event_stream_rpc_server_message_flush_fn *flush_fn, void *user_data);
```
"""
function aws_event_stream_rpc_server_connection_send_protocol_message(connection, message_args, flush_fn, user_data)
    ccall((:aws_event_stream_rpc_server_connection_send_protocol_message, libaws_c_event_stream), Cint, (Ptr{aws_event_stream_rpc_server_connection}, Ptr{aws_event_stream_rpc_message_args}, Ptr{aws_event_stream_rpc_server_message_flush_fn}, Ptr{Cvoid}), connection, message_args, flush_fn, user_data)
end

"""
    aws_event_stream_rpc_server_continuation_acquire(continuation)

Documentation not found.
### Prototype
```c
void aws_event_stream_rpc_server_continuation_acquire( struct aws_event_stream_rpc_server_continuation_token *continuation);
```
"""
function aws_event_stream_rpc_server_continuation_acquire(continuation)
    ccall((:aws_event_stream_rpc_server_continuation_acquire, libaws_c_event_stream), Cvoid, (Ptr{aws_event_stream_rpc_server_continuation_token},), continuation)
end

"""
    aws_event_stream_rpc_server_continuation_release(continuation)

Documentation not found.
### Prototype
```c
void aws_event_stream_rpc_server_continuation_release( struct aws_event_stream_rpc_server_continuation_token *continuation);
```
"""
function aws_event_stream_rpc_server_continuation_release(continuation)
    ccall((:aws_event_stream_rpc_server_continuation_release, libaws_c_event_stream), Cvoid, (Ptr{aws_event_stream_rpc_server_continuation_token},), continuation)
end

"""
    aws_event_stream_rpc_server_continuation_is_closed(continuation)

returns true if the continuation is still in an open state.

### Prototype
```c
bool aws_event_stream_rpc_server_continuation_is_closed( struct aws_event_stream_rpc_server_continuation_token *continuation);
```
"""
function aws_event_stream_rpc_server_continuation_is_closed(continuation)
    ccall((:aws_event_stream_rpc_server_continuation_is_closed, libaws_c_event_stream), Bool, (Ptr{aws_event_stream_rpc_server_continuation_token},), continuation)
end

"""
    aws_event_stream_rpc_server_continuation_send_message(continuation, message_args, flush_fn, user_data)

Sends an application message on the continuation. If the message is valid and successfully written to the channel, flush\\_fn will be invoked.

### Prototype
```c
int aws_event_stream_rpc_server_continuation_send_message( struct aws_event_stream_rpc_server_continuation_token *continuation, const struct aws_event_stream_rpc_message_args *message_args, aws_event_stream_rpc_server_message_flush_fn *flush_fn, void *user_data);
```
"""
function aws_event_stream_rpc_server_continuation_send_message(continuation, message_args, flush_fn, user_data)
    ccall((:aws_event_stream_rpc_server_continuation_send_message, libaws_c_event_stream), Cint, (Ptr{aws_event_stream_rpc_server_continuation_token}, Ptr{aws_event_stream_rpc_message_args}, Ptr{aws_event_stream_rpc_server_message_flush_fn}, Ptr{Cvoid}), continuation, message_args, flush_fn, user_data)
end

"""
Documentation not found.
"""
const AWS_C_EVENT_STREAM_PACKAGE_ID = 4

"""
Documentation not found.
"""
const AWS_EVENT_STREAM_MAX_MESSAGE_SIZE = 24 * 1024 * 1024

"""
Documentation not found.
"""
const AWS_EVENT_STREAM_MAX_HEADERS_SIZE = AWS_EVENT_STREAM_MAX_MESSAGE_SIZE

"""
Documentation not found.
"""
const AWS_EVENT_STREAM_HEADER_NAME_LEN_MAX = INT8_MAX

"""
Documentation not found.
"""
const AWS_EVENT_STREAM_HEADER_VALUE_LEN_MAX = INT16_MAX

"""
Documentation not found.
"""
const AWS_EVENT_STREAM_PRELUDE_LENGTH = uint32_t(12)

"""
Documentation not found.
"""
const AWS_EVENT_STREAM_TRAILER_LENGTH = uint32_t(4)

