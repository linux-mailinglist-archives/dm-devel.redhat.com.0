Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1315D10683C
	for <lists+dm-devel@lfdr.de>; Fri, 22 Nov 2019 09:45:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574412320;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+0/1ZXisQXqD1IaHgnWd53MNGCr8+yM3bP+hEJEVDe4=;
	b=XN4GeHGvDr6fMndL6Po1shVwgii1AWp4nZiu8qc0Ycm5tgJ6cygQ/7Eew56FnZxi5ixJqI
	v/jS46vkTboaM1rbFjfTB2QuCPAKKAJkMDO6roYXvBS+8VVEVeZXQbFp7x94azXPR2dIwg
	jyTQpQmMSbZIjA3mkOkxvEL9H+jPJZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-ZtDiftKhM2Wgd01xNBWCCw-1; Fri, 22 Nov 2019 03:45:18 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D36A107ACCA;
	Fri, 22 Nov 2019 08:45:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0132A60167;
	Fri, 22 Nov 2019 08:45:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E396918089C8;
	Fri, 22 Nov 2019 08:45:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAM62CAZ004147 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 Nov 2019 01:02:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 02700100D61; Fri, 22 Nov 2019 06:02:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2BA6E38DF
	for <dm-devel@redhat.com>; Fri, 22 Nov 2019 06:02:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3F25185A79C
	for <dm-devel@redhat.com>; Fri, 22 Nov 2019 06:02:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-24-XbOBI2XSOlCCzc_K08_dwA-1; 
	Fri, 22 Nov 2019 01:02:05 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8EA3A2071F;
	Fri, 22 Nov 2019 06:02:03 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Fri, 22 Nov 2019 01:00:30 -0500
Message-Id: <20191122060129.4239-31-sashal@kernel.org>
In-Reply-To: <20191122060129.4239-1-sashal@kernel.org>
References: <20191122060129.4239-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-MC-Unique: XbOBI2XSOlCCzc_K08_dwA-1
X-MC-Unique: ZtDiftKhM2Wgd01xNBWCCw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAM62CAZ004147
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 22 Nov 2019 03:43:26 -0500
Cc: Sweet Tea <sweettea@redhat.com>, Sasha Levin <sashal@kernel.org>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	John Dorminy <jdorminy@redhat.com>
Subject: [dm-devel] [PATCH AUTOSEL 4.9 32/91] dm flakey: Properly corrupt
	multi-page bios.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From: Sweet Tea <sweettea@redhat.com>

[ Upstream commit a00f5276e26636cbf72f24f79831026d2e2868e7 ]

The flakey target is documented to be able to corrupt the Nth byte in
a bio, but does not corrupt byte indices after the first biovec in the
bio. Change the corrupting function to actually corrupt the Nth byte
no matter in which biovec that index falls.

A test device generating two-page bios, atop a flakey device configured
to corrupt a byte index on the second page, verified both the failure
to corrupt before this patch and the expected corruption after this
change.

Signed-off-by: John Dorminy <jdorminy@redhat.com>
Signed-off-by: Mike Snitzer <snitzer@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/md/dm-flakey.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/md/dm-flakey.c b/drivers/md/dm-flakey.c
index 3643cba713518..742c1fa870dae 100644
--- a/drivers/md/dm-flakey.c
+++ b/drivers/md/dm-flakey.c
@@ -258,20 +258,31 @@ static void flakey_map_bio(struct dm_target *ti, stru=
ct bio *bio)
=20
 static void corrupt_bio_data(struct bio *bio, struct flakey_c *fc)
 {
-=09unsigned bio_bytes =3D bio_cur_bytes(bio);
-=09char *data =3D bio_data(bio);
+=09unsigned int corrupt_bio_byte =3D fc->corrupt_bio_byte - 1;
+
+=09struct bvec_iter iter;
+=09struct bio_vec bvec;
+
+=09if (!bio_has_data(bio))
+=09=09return;
=20
 =09/*
-=09 * Overwrite the Nth byte of the data returned.
+=09 * Overwrite the Nth byte of the bio's data, on whichever page
+=09 * it falls.
 =09 */
-=09if (data && bio_bytes >=3D fc->corrupt_bio_byte) {
-=09=09data[fc->corrupt_bio_byte - 1] =3D fc->corrupt_bio_value;
-
-=09=09DMDEBUG("Corrupting data bio=3D%p by writing %u to byte %u "
-=09=09=09"(rw=3D%c bi_opf=3D%u bi_sector=3D%llu cur_bytes=3D%u)\n",
-=09=09=09bio, fc->corrupt_bio_value, fc->corrupt_bio_byte,
-=09=09=09(bio_data_dir(bio) =3D=3D WRITE) ? 'w' : 'r', bio->bi_opf,
-=09=09=09(unsigned long long)bio->bi_iter.bi_sector, bio_bytes);
+=09bio_for_each_segment(bvec, bio, iter) {
+=09=09if (bio_iter_len(bio, iter) > corrupt_bio_byte) {
+=09=09=09char *segment =3D (page_address(bio_iter_page(bio, iter))
+=09=09=09=09=09 + bio_iter_offset(bio, iter));
+=09=09=09segment[corrupt_bio_byte] =3D fc->corrupt_bio_value;
+=09=09=09DMDEBUG("Corrupting data bio=3D%p by writing %u to byte %u "
+=09=09=09=09"(rw=3D%c bi_opf=3D%u bi_sector=3D%llu size=3D%u)\n",
+=09=09=09=09bio, fc->corrupt_bio_value, fc->corrupt_bio_byte,
+=09=09=09=09(bio_data_dir(bio) =3D=3D WRITE) ? 'w' : 'r', bio->bi_opf,
+=09=09=09=09(unsigned long long)bio->bi_iter.bi_sector, bio->bi_iter.bi_si=
ze);
+=09=09=09break;
+=09=09}
+=09=09corrupt_bio_byte -=3D bio_iter_len(bio, iter);
 =09}
 }
=20
--=20
2.20.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

