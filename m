Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 48A4126CE99
	for <lists+dm-devel@lfdr.de>; Thu, 17 Sep 2020 00:22:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-q9bbuB0ENjG1-Xr4_lat9w-1; Wed, 16 Sep 2020 18:22:05 -0400
X-MC-Unique: q9bbuB0ENjG1-Xr4_lat9w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B99F68030CC;
	Wed, 16 Sep 2020 22:21:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DF8F1992F;
	Wed, 16 Sep 2020 22:21:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE7E044A72;
	Wed, 16 Sep 2020 22:21:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GMLSKR003424 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 18:21:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C82FC200A4F4; Wed, 16 Sep 2020 22:21:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0621201EB53
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 22:21:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F2E89063AC
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 22:21:24 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-405-F2nmcA4TMiiCiF3K8zAvrQ-1; Wed, 16 Sep 2020 18:21:20 -0400
X-MC-Unique: F2nmcA4TMiiCiF3K8zAvrQ-1
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08GIaXGE168234; Wed, 16 Sep 2020 18:40:16 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by userp2130.oracle.com with ESMTP id 33gnrr4w13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 16 Sep 2020 18:40:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08GIOlVa190393; Wed, 16 Sep 2020 18:40:16 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3030.oracle.com with ESMTP id 33h89270xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Sep 2020 18:40:16 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08GIeF3f012690;
	Wed, 16 Sep 2020 18:40:15 GMT
Received: from supannee-devvm-ol7.osdevelopmeniad.oraclevcn.com
	(/100.100.231.179) by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 16 Sep 2020 18:40:14 +0000
From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
To: agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com
Date: Wed, 16 Sep 2020 18:40:06 +0000
Message-Id: <1600281606-1446-3-git-send-email-sudhakar.panneerselvam@oracle.com>
In-Reply-To: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
References: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746
	signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	spamscore=0 adultscore=0
	suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009160130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746
	signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	spamscore=0
	lowpriorityscore=0 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=0
	clxscore=1015 mlxlogscore=999 adultscore=0 priorityscore=1501
	impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009160130
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: shirley.ma@oracle.com, ssudhakarp@gmail.com, martin.petersen@oracle.com
Subject: [dm-devel] [RFC PATCH 2/2] dm crypt: Handle unaligned bio buffer
	lengths for lmk and tcw
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Us sg_miter_* apis to process unaligned buffer lengths while handling
bio buffers for lmk and tcw IV generation algorithms.

Signed-off-by: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
---
 drivers/md/dm-crypt.c | 104 +++++++++++++++++++++++++++++++++-----------------
 1 file changed, 68 insertions(+), 36 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 9c26ad08732f..c40ada41d8ef 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -471,11 +471,13 @@ static int crypt_iv_lmk_wipe(struct crypt_config *cc)
 
 static int crypt_iv_lmk_one(struct crypt_config *cc, u8 *iv,
 			    struct dm_crypt_request *dmreq,
-			    u8 *data)
+			    struct scatterlist *sg)
 {
 	struct iv_lmk_private *lmk = &cc->iv_gen_private.lmk;
 	SHASH_DESC_ON_STACK(desc, lmk->hash_tfm);
+	struct sg_mapping_iter miter;
 	struct md5_state md5state;
+	size_t len = 16 * 31;
 	__le32 buf[4];
 	int i, r;
 
@@ -492,7 +494,19 @@ static int crypt_iv_lmk_one(struct crypt_config *cc, u8 *iv,
 	}
 
 	/* Sector is always 512B, block size 16, add data of blocks 1-31 */
-	r = crypto_shash_update(desc, data + 16, 16 * 31);
+	sg_miter_start(&miter, sg, sg_nents(sg),
+		       SG_MITER_ATOMIC | SG_MITER_FROM_SG);
+	sg_miter_skip(&miter, 16);
+	while (sg_miter_next(&miter) && len > 0) {
+		size_t hash_len = min_t(size_t, miter.length, len);
+
+		r = crypto_shash_update(desc, miter.addr, hash_len);
+		if (r)
+			break;
+		len -= hash_len;
+	}
+	sg_miter_stop(&miter);
+
 	if (r)
 		return r;
 
@@ -520,15 +534,11 @@ static int crypt_iv_lmk_one(struct crypt_config *cc, u8 *iv,
 static int crypt_iv_lmk_gen(struct crypt_config *cc, u8 *iv,
 			    struct dm_crypt_request *dmreq)
 {
-	struct scatterlist *sg;
-	u8 *src;
 	int r = 0;
 
 	if (bio_data_dir(dmreq->ctx->bio_in) == WRITE) {
-		sg = crypt_get_sg_data(cc, dmreq->sg_in);
-		src = kmap_atomic(sg_page(sg));
-		r = crypt_iv_lmk_one(cc, iv, dmreq, src + sg->offset);
-		kunmap_atomic(src);
+		r = crypt_iv_lmk_one(cc, iv, dmreq,
+				     crypt_get_sg_data(cc, dmreq->sg_in));
 	} else
 		memset(iv, 0, cc->iv_size);
 
@@ -538,22 +548,32 @@ static int crypt_iv_lmk_gen(struct crypt_config *cc, u8 *iv,
 static int crypt_iv_lmk_post(struct crypt_config *cc, u8 *iv,
 			     struct dm_crypt_request *dmreq)
 {
+	struct sg_mapping_iter miter;
 	struct scatterlist *sg;
-	u8 *dst;
-	int r;
+	int r, offset = 0;
+	size_t len;
 
 	if (bio_data_dir(dmreq->ctx->bio_in) == WRITE)
 		return 0;
 
 	sg = crypt_get_sg_data(cc, dmreq->sg_out);
-	dst = kmap_atomic(sg_page(sg));
-	r = crypt_iv_lmk_one(cc, iv, dmreq, dst + sg->offset);
+	r = crypt_iv_lmk_one(cc, iv, dmreq, sg);
+	if (r)
+		return r;
 
 	/* Tweak the first block of plaintext sector */
-	if (!r)
-		crypto_xor(dst + sg->offset, iv, cc->iv_size);
+	len = cc->iv_size;
+	sg_miter_start(&miter, sg, sg_nents(sg),
+		       SG_MITER_ATOMIC | SG_MITER_TO_SG);
+	while (sg_miter_next(&miter) && len > 0) {
+		size_t xor_len = min_t(size_t, miter.length, len);
+
+		crypto_xor(miter.addr, iv + offset, xor_len);
+		len -= xor_len;
+		offset += xor_len;
+	}
+	sg_miter_stop(&miter);
 
-	kunmap_atomic(dst);
 	return r;
 }
 
@@ -627,12 +647,14 @@ static int crypt_iv_tcw_wipe(struct crypt_config *cc)
 
 static int crypt_iv_tcw_whitening(struct crypt_config *cc,
 				  struct dm_crypt_request *dmreq,
-				  u8 *data)
+				  struct scatterlist *sg)
 {
 	struct iv_tcw_private *tcw = &cc->iv_gen_private.tcw;
 	__le64 sector = cpu_to_le64(dmreq->iv_sector);
+	struct sg_mapping_iter miter;
 	u8 buf[TCW_WHITENING_SIZE];
 	SHASH_DESC_ON_STACK(desc, tcw->crc32_tfm);
+	size_t remain, sgoffset = 0;
 	int i, r;
 
 	/* xor whitening with sector number */
@@ -656,8 +678,31 @@ static int crypt_iv_tcw_whitening(struct crypt_config *cc,
 	crypto_xor(&buf[4], &buf[8], 4);
 
 	/* apply whitening (8 bytes) to whole sector */
-	for (i = 0; i < ((1 << SECTOR_SHIFT) / 8); i++)
-		crypto_xor(data + i * 8, buf, 8);
+	sg_miter_start(&miter, sg, sg_nents(sg),
+		       SG_MITER_ATOMIC | SG_MITER_TO_SG);
+	sg_miter_next(&miter);
+	remain = miter.length;
+	for (i = 0; i < ((1 << SECTOR_SHIFT) / 8); i++) {
+		size_t len = 8, offset = 0;
+
+		while (len > 0) {
+			size_t xor_len = min_t(size_t, remain, len);
+
+			crypto_xor(miter.addr + sgoffset, buf + offset,
+				   xor_len);
+			len -= xor_len;
+			remain -= xor_len;
+			offset += xor_len;
+			sgoffset += xor_len;
+			if (remain == 0) {
+				sg_miter_next(&miter);
+				sgoffset = 0;
+				remain = miter.length;
+			}
+		}
+	}
+	sg_miter_stop(&miter);
+
 out:
 	memzero_explicit(buf, sizeof(buf));
 	return r;
@@ -666,19 +711,14 @@ static int crypt_iv_tcw_whitening(struct crypt_config *cc,
 static int crypt_iv_tcw_gen(struct crypt_config *cc, u8 *iv,
 			    struct dm_crypt_request *dmreq)
 {
-	struct scatterlist *sg;
 	struct iv_tcw_private *tcw = &cc->iv_gen_private.tcw;
 	__le64 sector = cpu_to_le64(dmreq->iv_sector);
-	u8 *src;
 	int r = 0;
 
 	/* Remove whitening from ciphertext */
-	if (bio_data_dir(dmreq->ctx->bio_in) != WRITE) {
-		sg = crypt_get_sg_data(cc, dmreq->sg_in);
-		src = kmap_atomic(sg_page(sg));
-		r = crypt_iv_tcw_whitening(cc, dmreq, src + sg->offset);
-		kunmap_atomic(src);
-	}
+	if (bio_data_dir(dmreq->ctx->bio_in) != WRITE)
+		r = crypt_iv_tcw_whitening(cc, dmreq,
+					   crypt_get_sg_data(cc, dmreq->sg_in));
 
 	/* Calculate IV */
 	crypto_xor_cpy(iv, tcw->iv_seed, (u8 *)&sector, 8);
@@ -692,20 +732,12 @@ static int crypt_iv_tcw_gen(struct crypt_config *cc, u8 *iv,
 static int crypt_iv_tcw_post(struct crypt_config *cc, u8 *iv,
 			     struct dm_crypt_request *dmreq)
 {
-	struct scatterlist *sg;
-	u8 *dst;
-	int r;
-
 	if (bio_data_dir(dmreq->ctx->bio_in) != WRITE)
 		return 0;
 
 	/* Apply whitening on ciphertext */
-	sg = crypt_get_sg_data(cc, dmreq->sg_out);
-	dst = kmap_atomic(sg_page(sg));
-	r = crypt_iv_tcw_whitening(cc, dmreq, dst + sg->offset);
-	kunmap_atomic(dst);
-
-	return r;
+	return crypt_iv_tcw_whitening(cc, dmreq,
+				      crypt_get_sg_data(cc, dmreq->sg_out));
 }
 
 static int crypt_iv_random_gen(struct crypt_config *cc, u8 *iv,
-- 
1.8.3.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

