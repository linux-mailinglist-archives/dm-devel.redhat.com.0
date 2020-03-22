Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 5B86018F052
	for <lists+dm-devel@lfdr.de>; Mon, 23 Mar 2020 08:35:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584948942;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cOHG05qraK8+em2pEoObt0s1GRWHFvRqM0UDixeyKcg=;
	b=chBraD9CskWWlYWtPRgJIXPSzGgQzdVBwF06zbFTCYQtKB/O7ft7+m+2f68YkY2TJ7bz7A
	Jv1behvf3b5in3vPQ+BZe0+0SBYf2gSmGtAsZPE7IjQpIF/kKMM6DeeZ9yq7nYXkYM+VPK
	CyJX2e/nSse1+7Pswn+ltmFNSOhXCzo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-DM9576_RNfeg4fzTv-rPhA-1; Mon, 23 Mar 2020 03:35:39 -0400
X-MC-Unique: DM9576_RNfeg4fzTv-rPhA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C50BB107ACC4;
	Mon, 23 Mar 2020 07:35:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A44257E325;
	Mon, 23 Mar 2020 07:35:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5788618089CD;
	Mon, 23 Mar 2020 07:35:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02M9U4kn012884 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 22 Mar 2020 05:30:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 54CA12166B27; Sun, 22 Mar 2020 09:30:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50BF42166B2F
	for <dm-devel@redhat.com>; Sun, 22 Mar 2020 09:30:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87F318F6902
	for <dm-devel@redhat.com>; Sun, 22 Mar 2020 09:30:01 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-455-I_ABygRpMFKZiBYZJFkqfw-1; Sun, 22 Mar 2020 05:29:59 -0400
X-MC-Unique: I_ABygRpMFKZiBYZJFkqfw-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02M9OcCX024473; Sun, 22 Mar 2020 09:29:57 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2120.oracle.com with ESMTP id 2ywbjmtmpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Mar 2020 09:29:57 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02M9NHNc031658; Sun, 22 Mar 2020 09:29:56 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3030.oracle.com with ESMTP id 2ywwug7k85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Mar 2020 09:29:56 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02M9TtdP027561;
	Sun, 22 Mar 2020 09:29:55 GMT
Received: from localhost.localdomain (/114.88.246.185)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Sun, 22 Mar 2020 02:29:54 -0700
From: Bob Liu <bob.liu@oracle.com>
To: dm-devel@redhat.com
Date: Sun, 22 Mar 2020 17:29:12 +0800
Message-Id: <20200322092912.23148-1-bob.liu@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9567
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	suspectscore=1 spamscore=0
	mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003220055
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9567
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 bulkscore=0
	mlxlogscore=999 spamscore=0 malwarescore=0 suspectscore=1
	impostorscore=0
	clxscore=1011 phishscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003220055
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02M9U4kn012884
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Mar 2020 03:34:50 -0400
Cc: linux-block@vger.kernel.org, Dmitry.Fomichev@wdc.com, Damien.LeMoal@wdc.com,
	Bob Liu <bob.liu@oracle.com>
Subject: [dm-devel] [PATCH] dm zoned: remove duplicated nr_rnd_zones
	increasement
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

zmd->nr_rnd_zones was increased twice by mistake.
The other place:
1131                 zmd->nr_useable_zones++;
1132                 if (dmz_is_rnd(zone)) {
1133                         zmd->nr_rnd_zones++;
					^^^

Signed-off-by: Bob Liu <bob.liu@oracle.com>
---
 drivers/md/dm-zoned-metadata.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 516c7b6..369de15 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1109,7 +1109,6 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
 	switch (blkz->type) {
 	case BLK_ZONE_TYPE_CONVENTIONAL:
 		set_bit(DMZ_RND, &zone->flags);
-		zmd->nr_rnd_zones++;
 		break;
 	case BLK_ZONE_TYPE_SEQWRITE_REQ:
 	case BLK_ZONE_TYPE_SEQWRITE_PREF:
-- 
2.9.5


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

