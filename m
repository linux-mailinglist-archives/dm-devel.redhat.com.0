Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id AA94C219D86
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:18:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-5OGxXU0qPqi7kry8WR4mEA-1; Thu, 09 Jul 2020 06:17:28 -0400
X-MC-Unique: 5OGxXU0qPqi7kry8WR4mEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 003251083E84;
	Thu,  9 Jul 2020 10:17:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D015660C80;
	Thu,  9 Jul 2020 10:17:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8375093F8E;
	Thu,  9 Jul 2020 10:17:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AGv06029347 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:16:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D09EE2166B28; Thu,  9 Jul 2020 10:16:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCD0F2157F24
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:16:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABBF21884991
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:16:55 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-180-tatjEJbBO-m4KlMYUteeZA-1;
	Thu, 09 Jul 2020 06:16:53 -0400
X-MC-Unique: tatjEJbBO-m4KlMYUteeZA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8C7CBB05D;
	Thu,  9 Jul 2020 10:16:51 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:15:47 +0200
Message-Id: <20200709101620.6786-3-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AGv06029347
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 02/35] multipath-tools tests/directio: fix
	missing initializers
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

clang-3.9 doesn't like the {0} initializers for complex data structures.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/directio.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/tests/directio.c b/tests/directio.c
index 66aaf0e..9895409 100644
--- a/tests/directio.c
+++ b/tests/directio.c
@@ -31,7 +31,7 @@ int test_fd = 111;
 int ioctx_count = 0;
 struct io_event mock_events[AIO_GROUP_SIZE]; /* same as the checker max */
 int ev_off = 0;
-struct timespec zero_timeout = {0};
+struct timespec zero_timeout = { .tv_sec = 0 };
 struct timespec full_timeout = { .tv_sec = -1 };
 
 int __real_ioctl(int fd, unsigned long request, void *argp);
@@ -287,7 +287,7 @@ static void test_reset(void **state)
 /* tests initializing, then resetting, and then initializing again */
 static void test_init_reset_init(void **state)
 {
-	struct checker c = {0};
+	struct checker c = {.cls = NULL};
 	struct aio_group *aio_grp, *tmp_grp;
 
 	assert_true(list_empty(&aio_grp_list));
@@ -315,7 +315,7 @@ static void test_init_reset_init(void **state)
 static void test_init_free(void **state)
 {
 	int i, count = 0;
-	struct checker c[4096] = {0};
+	struct checker c[4096] = {{.cls = NULL}};
 	struct aio_group *aio_grp = NULL;
 
 	assert_true(list_empty(&aio_grp_list));
@@ -361,7 +361,7 @@ static void test_init_free(void **state)
 static void test_multi_init_free(void **state)
 {
 	int i, count;
-	struct checker c[4096] = {0};
+	struct checker c[4096] = {{.cls = NULL}};
 	struct aio_group *aio_grp;
 
 	assert_true(list_empty(&aio_grp_list));
@@ -401,7 +401,7 @@ static void test_multi_init_free(void **state)
 /* simple single checker sync test */
 static void test_check_state_simple(void **state)
 {
-	struct checker c = {0};
+	struct checker c = {.cls = NULL};
 	struct async_req *req;
 	int res = 0;
 
@@ -417,7 +417,7 @@ static void test_check_state_simple(void **state)
 /* test sync timeout */
 static void test_check_state_timeout(void **state)
 {
-	struct checker c = {0};
+	struct checker c = {.cls = NULL};
 	struct aio_group *aio_grp;
 
 	assert_true(list_empty(&aio_grp_list));
@@ -440,7 +440,7 @@ static void test_check_state_timeout(void **state)
 /* test async timeout */
 static void test_check_state_async_timeout(void **state)
 {
-	struct checker c = {0};
+	struct checker c = {.cls = NULL};
 	struct aio_group *aio_grp;
 
 	assert_true(list_empty(&aio_grp_list));
@@ -467,7 +467,7 @@ static void test_check_state_async_timeout(void **state)
 /* test freeing checkers with outstanding requests */
 static void test_free_with_pending(void **state)
 {
-        struct checker c[2] = {0};
+        struct checker c[2] = {{.cls = NULL}};
         struct aio_group *aio_grp;
 	struct async_req *req;
 	int res = 0;
@@ -500,7 +500,7 @@ static void test_free_with_pending(void **state)
 /* test removing orpahed aio_group on free */
 static void test_orphaned_aio_group(void **state)
 {
-	struct checker c[AIO_GROUP_SIZE] = {0};
+	struct checker c[AIO_GROUP_SIZE] = {{.cls = NULL}};
 	struct aio_group *aio_grp, *tmp_grp;
 	int i;
 
@@ -533,7 +533,7 @@ static void test_orphaned_aio_group(void **state)
  * checker */
 static void test_timeout_cancel_failed(void **state)
 {
-	struct checker c[2] = {0};
+	struct checker c[2] = {{.cls = NULL}};
 	struct aio_group *aio_grp;
 	struct async_req *reqs[2];
 	int res[] = {0,0};
@@ -568,7 +568,7 @@ static void test_timeout_cancel_failed(void **state)
  * checker */
 static void test_async_timeout_cancel_failed(void **state)
 {
-	struct checker c[2] = {0};
+	struct checker c[2] = {{.cls = NULL}};
 	struct async_req *reqs[2];
 	int res[] = {0,0};
 	int i;
@@ -610,7 +610,7 @@ static void test_async_timeout_cancel_failed(void **state)
 /* test orphaning a request, and having another checker clean it up */
 static void test_orphan_checker_cleanup(void **state)
 {
-	struct checker c[2] = {0};
+	struct checker c[2] = {{.cls = NULL}};
 	struct async_req *reqs[2];
 	int res[] = {0,0};
 	struct aio_group *aio_grp;
@@ -667,7 +667,7 @@ static void test_orphan_reset_cleanup(void **state)
 static void test_check_state_blksize(void **state)
 {
 	int i;
-	struct checker c[3] = {0};
+	struct checker c[3] = {{.cls = NULL}};
 	int blksize[] = {4096, 1024, 512};
 	struct async_req *reqs[3];
 	int res[] = {0,1,0};
@@ -698,7 +698,7 @@ static void test_check_state_blksize(void **state)
 static void test_check_state_async(void **state)
 {
 	int i;
-	struct checker c[257] = {0};
+	struct checker c[257] = {{.cls = NULL}};
 	struct async_req *reqs[257];
 	int res[257] = {0};
 
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

