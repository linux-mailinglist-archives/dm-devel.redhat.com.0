Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A080026CFD5
	for <lists+dm-devel@lfdr.de>; Thu, 17 Sep 2020 02:12:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-VtI6zVhIOl-Vm_xnPqKZ1g-1; Wed, 16 Sep 2020 20:12:15 -0400
X-MC-Unique: VtI6zVhIOl-Vm_xnPqKZ1g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72A521868427;
	Thu, 17 Sep 2020 00:12:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6432E19D61;
	Thu, 17 Sep 2020 00:12:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B92D344A7F;
	Thu, 17 Sep 2020 00:11:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08H0Bcl8015996 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 20:11:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 81675200A799; Thu, 17 Sep 2020 00:11:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C82E2028CCE
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 00:11:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5512800161
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 00:11:35 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-532-7iiwtBvROwSixadJXeTEHg-1; Wed, 16 Sep 2020 20:11:31 -0400
X-MC-Unique: 7iiwtBvROwSixadJXeTEHg-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08GIaHm8124273; Wed, 16 Sep 2020 18:40:16 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2120.oracle.com with ESMTP id 33j91dpg18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 16 Sep 2020 18:40:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08GIPrBN138500; Wed, 16 Sep 2020 18:40:15 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3020.oracle.com with ESMTP id 33hm33aeqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Sep 2020 18:40:15 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08GIeEn4010214;
	Wed, 16 Sep 2020 18:40:14 GMT
Received: from supannee-devvm-ol7.osdevelopmeniad.oraclevcn.com
	(/100.100.231.179) by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 16 Sep 2020 18:40:14 +0000
From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
To: agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com
Date: Wed, 16 Sep 2020 18:40:05 +0000
Message-Id: <1600281606-1446-2-git-send-email-sudhakar.panneerselvam@oracle.com>
In-Reply-To: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
References: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746
	signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	bulkscore=0 mlxlogscore=999
	malwarescore=0 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009160130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746
	signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	impostorscore=0
	priorityscore=1501 malwarescore=0 suspectscore=0 mlxlogscore=999
	clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
	bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Subject: [dm-devel] [RFC PATCH 1/2] dm crypt: Allow unaligned bio buffer
	lengths for skcipher devices
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

crypt_convert_block_skcipher() rejects the I/O if the buffer length is
not a multiple of its sector size. This assumption holds true as long
as the originator of the I/Os are within Linux. But, in a QEMU
environment, with windows as guests that uses vhost-scsi interface, it
was observed that block layer could receive bio requests whose individual
buffer lengths may not be aligned at the sector size all the time. This
results in windows guest failing to boot or failing to format the block
devices that are backed by dm-crypt.

Not all low level block drivers require that the dma alignment to be a
multiple of 512 bytes. Some of the LLDs that has much relaxed constraint
on the buffer alignment are iSCSI, NVMe, SBP, MegaRaid, qla2xxx. Hence,
assuming the buffer lengths to be aligned to its sector size and based
on that rejecting the I/Os doesn't appear to be correct.

crypt_map() already ensures that the I/Os are always a multiple of its
sector size, hence, by the time the I/O reaches
crypt_convert_block_skcipher() and finds the data associated with the
sector is not fully in the same bio vector means that it could just be
that the sector data is scattered across two bio vectors. Hence, this
patch removes the buffer length check and adds the code that prepares
the sg list appropriately in case sector data is split between two bio
vectors.

With this change, windows was successfully be able to boot from a block
device that is backed by dm-crypt device in a QEMU environment.

Signed-off-by: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
---
 drivers/md/dm-crypt.c | 50 ++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 380386c36921..9c26ad08732f 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -1275,6 +1275,23 @@ static void *iv_tag_from_dmreq(struct crypt_config *cc,
 	return tag_from_dmreq(cc, dmreq) + cc->integrity_tag_size;
 }
 
+static int build_split_sg(struct scatterlist *sg, struct bio_vec *bvec,
+			  struct bio *bio, struct bvec_iter *iter,
+			  unsigned short int sector_size)
+{
+	int bytes_first_page;
+
+	bytes_first_page = bvec->bv_len;
+	sg_set_page(sg, bvec->bv_page, bvec->bv_len, bvec->bv_offset);
+	bio_advance_iter(bio, iter, bvec->bv_len);
+	*bvec = bio_iter_iovec(bio, *iter);
+	sg++;
+	sg_set_page(sg, bvec->bv_page, sector_size - bytes_first_page,
+		    bvec->bv_offset);
+
+	return bytes_first_page;
+}
+
 static int crypt_convert_block_aead(struct crypt_config *cc,
 				     struct convert_context *ctx,
 				     struct aead_request *req,
@@ -1379,15 +1396,12 @@ static int crypt_convert_block_skcipher(struct crypt_config *cc,
 	struct bio_vec bv_in = bio_iter_iovec(ctx->bio_in, ctx->iter_in);
 	struct bio_vec bv_out = bio_iter_iovec(ctx->bio_out, ctx->iter_out);
 	struct scatterlist *sg_in, *sg_out;
+	int src_split = 0, dst_split = 0;
 	struct dm_crypt_request *dmreq;
 	u8 *iv, *org_iv, *tag_iv;
 	__le64 *sector;
 	int r = 0;
 
-	/* Reject unexpected unaligned bio. */
-	if (unlikely(bv_in.bv_len & (cc->sector_size - 1)))
-		return -EIO;
-
 	dmreq = dmreq_of_req(cc, req);
 	dmreq->iv_sector = ctx->cc_sector;
 	if (test_bit(CRYPT_IV_LARGE_SECTORS, &cc->cipher_flags))
@@ -1407,11 +1421,25 @@ static int crypt_convert_block_skcipher(struct crypt_config *cc,
 	sg_in  = &dmreq->sg_in[0];
 	sg_out = &dmreq->sg_out[0];
 
-	sg_init_table(sg_in, 1);
-	sg_set_page(sg_in, bv_in.bv_page, cc->sector_size, bv_in.bv_offset);
+	if (unlikely(bv_in.bv_len < cc->sector_size)) {
+		sg_init_table(sg_in, 2);
+		src_split = build_split_sg(sg_in, &bv_in, ctx->bio_in,
+					   &ctx->iter_in, cc->sector_size);
+	} else {
+		sg_init_table(sg_in, 1);
+		sg_set_page(sg_in, bv_in.bv_page, cc->sector_size,
+			    bv_in.bv_offset);
+	}
 
-	sg_init_table(sg_out, 1);
-	sg_set_page(sg_out, bv_out.bv_page, cc->sector_size, bv_out.bv_offset);
+	if (unlikely(bv_out.bv_len < cc->sector_size)) {
+		sg_init_table(sg_out, 2);
+		dst_split = build_split_sg(sg_out, &bv_out, ctx->bio_out,
+					   &ctx->iter_out, cc->sector_size);
+	} else {
+		sg_init_table(sg_out, 1);
+		sg_set_page(sg_out, bv_out.bv_page, cc->sector_size,
+			    bv_out.bv_offset);
+	}
 
 	if (cc->iv_gen_ops) {
 		/* For READs use IV stored in integrity metadata */
@@ -1442,8 +1470,10 @@ static int crypt_convert_block_skcipher(struct crypt_config *cc,
 	if (!r && cc->iv_gen_ops && cc->iv_gen_ops->post)
 		r = cc->iv_gen_ops->post(cc, org_iv, dmreq);
 
-	bio_advance_iter(ctx->bio_in, &ctx->iter_in, cc->sector_size);
-	bio_advance_iter(ctx->bio_out, &ctx->iter_out, cc->sector_size);
+	bio_advance_iter(ctx->bio_in, &ctx->iter_in,
+			 cc->sector_size - src_split);
+	bio_advance_iter(ctx->bio_out, &ctx->iter_out,
+			 cc->sector_size - dst_split);
 
 	return r;
 }
-- 
1.8.3.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

