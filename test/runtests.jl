using Test, Aqua, LibAwsEventStream, LibAwsCommon

@testset "LibAwsEventStream" begin
    @testset "aqua" begin
        Aqua.test_all(LibAwsEventStream, ambiguities=false)
        Aqua.test_ambiguities(LibAwsEventStream)
    end
    @testset "basic usage to test the library loads" begin
        alloc = aws_default_allocator() # important! this shouldn't need to be qualified! if we generate a definition for it in LibAwsEventStream that is a bug.
        aws_event_stream_library_init(alloc)
    end
end
