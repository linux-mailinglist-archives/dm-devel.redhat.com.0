Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E29D715281B
	for <lists+dm-devel@lfdr.de>; Wed,  5 Feb 2020 10:18:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580894323;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YhD6XaQv3jHKOwiIq/Rb5lK6jB/xXMlIQEO+Aq/KkSU=;
	b=dI6TLckU/OjQ8mJHQo8kPYmwtSICsz9BNQTF58c770yoIkkP/a+GCe/P2LL2zGBcDfj4a7
	fjLRXSrQK65zJXHh23Gta7BerBDGPE2zRplBdLT+mdOickNrT9tFaVMbpucNKOSpmtr2so
	vC5SQfVpG1+3q0jBtrWIk96g8w4nK5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-F-430XoBPcWJe6-A350KJw-1; Wed, 05 Feb 2020 04:18:41 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D114140B;
	Wed,  5 Feb 2020 09:18:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D0CA1001B3F;
	Wed,  5 Feb 2020 09:18:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ADBA181753;
	Wed,  5 Feb 2020 09:18:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0159Hqme032077 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 04:17:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CDB0E60C63; Wed,  5 Feb 2020 09:17:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBB8D60BF7;
	Wed,  5 Feb 2020 09:17:47 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 0159HlmW008560; Wed, 5 Feb 2020 04:17:47 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 0159Hli4008556; Wed, 5 Feb 2020 04:17:47 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 5 Feb 2020 04:17:47 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Joe Thornber <thornber@redhat.com>
In-Reply-To: <alpine.LRH.2.02.2002041513390.20730@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2002050411220.8320@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200128154641.ppphhatq5hw3rtgt@reti>
	<alpine.LRH.2.02.2002041513390.20730@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, msnitzer@redhat.com, nkshirsa@redhat.com,
	ejt@redhat.com
Subject: [dm-devel] [PATCH] dm-writecache: fix allocation of devices on
 writecache tests
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: F-430XoBPcWJe6-A350KJw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Here I'm sending a patch for device mapper tests suite. With this patch, 
the cache is allocated on the fast device. It performs slightly better 
than dm-cache on the git-checkout benchmark:

DM-CACHE git tests:
SMQComparisonTests
  git_extract_only_across_cache_size_smq...formatting ...
getting repo ...
Elapsed 89.0716564: git_prepare
Checking out v2.6.12 ...
Checking out v2.6.13 ...
Checking out v2.6.14 ...
Elapsed 98.78236956: extract all versions
Checking out v2.6.12 ...
Checking out v2.6.13 ...
Checking out v2.6.14 ...
Elapsed 81.25339984: extract all versions
Elapsed 271.27901308: cache size = 256, policy = smq
formatting ...
getting repo ...
Elapsed 80.05892212: git_prepare
Checking out v2.6.12 ...
Checking out v2.6.13 ...
Checking out v2.6.14 ...
Elapsed 84.97932172: extract all versions


DM-WRITECACHE git tests:
Loaded suite writecache
WriteCacheBenchmarks
  git_extract_only_across_cache_size...formatting ...
getting repo ...
Elapsed 81.97540516: git_prepare
Checking out v2.6.12 ...
Checking out v2.6.13 ...
Checking out v2.6.14 ...
Elapsed 79.58938916: extract all versions
Checking out v2.6.12 ...
Checking out v2.6.13 ...
Checking out v2.6.14 ...
Elapsed 73.42351832: extract all versions
Elapsed 241.46500768: cache size = 256
formatting ...
getting repo ...
Elapsed 89.21745808: git_prepare
Checking out v2.6.12 ...
Checking out v2.6.13 ...
Checking out v2.6.14 ...
Elapsed 74.49628804: extract all versions


From: Mikulas Patocka <mpatocka@redhat.com>

Writecache tests used the slow device for both data and cache device -
this resulted in horrible performance.

This patch fixes it, so that the fast device is used for the cache.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 lib/dmtest/writecache-stack.rb |   12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

Index: device-mapper-test-suite/lib/dmtest/writecache-stack.rb
===================================================================
--- device-mapper-test-suite.orig/lib/dmtest/writecache-stack.rb	2020-02-05 10:02:41.000000000 +0100
+++ device-mapper-test-suite/lib/dmtest/writecache-stack.rb	2020-02-05 10:02:41.000000000 +0100
@@ -29,14 +29,12 @@ class WriteCacheStack
     @cache = nil
     @opts = opts
 
-    #@tvm = TinyVolumeManager::VM.new
-    #@tvm.add_allocation_volume(ssd_dev)
-    #@tvm.add_volume(linear_vol('ssd', cache_size == :all ? @tvm.free_space : cache_size))
+    @tvm = TinyVolumeManager::VM.new
+    @tvm.add_allocation_volume(ssd_dev)
+    @tvm.add_volume(linear_vol('ssd', cache_size == :all ? @tvm.free_space : cache_size))
 
     @data_tvm = TinyVolumeManager::VM.new
     @data_tvm.add_allocation_volume(spindle_dev)
-
-    @data_tvm.add_volume(linear_vol('ssd', cache_size == :all ? @tvm.free_space : cache_size))
     @data_tvm.add_volume(linear_vol('origin', origin_size == :all ? @data_tvm.free_space : origin_size))
   end
 
@@ -53,7 +51,7 @@ class WriteCacheStack
   end
 
   def activate_support_devs(&block)
-    with_devs(@data_tvm.table('ssd'),
+    with_devs(@tvm.table('ssd'),
               @data_tvm.table('origin')) do |ssd, origin|
       @ssd = ssd
       @origin = origin
@@ -71,7 +69,7 @@ class WriteCacheStack
   end
 
   def activate(&block)
-    with_devs(@data_tvm.table('ssd'),
+    with_devs(@tvm.table('ssd'),
               @data_tvm.table('origin')) do |ssd, origin|
       @ssd = ssd
       @origin = origin

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

