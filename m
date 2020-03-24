Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 5C487192230
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 09:13:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585124006;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=P7L0+rIYeZVI2NcY/LwkN6Xoc7Q8uCthxVDFcn5c+3Q=;
	b=QqV/k1QxfpS9NwDN2coIHnr1n+6ZNdhXKwX/IgDjGuVrbd6Tt14Lc3aFasoIqQ5u2d8JGK
	XBv6wya6neZvvaa/SmsqFqbxkTjXSpKeV+dG558fmIs3LKJZVb2ScrWtsqpVahsLl1+hRz
	x5T/7Pzq6XCaV/zvS2Qb2+VzFQNve8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-t_aMQhesPxG3Hjdn9ojGQw-1; Wed, 25 Mar 2020 04:13:23 -0400
X-MC-Unique: t_aMQhesPxG3Hjdn9ojGQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53D99100DFC5;
	Wed, 25 Mar 2020 08:13:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2739B1BC6D;
	Wed, 25 Mar 2020 08:13:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A83E086387;
	Wed, 25 Mar 2020 08:13:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02ODNeS7021735 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Mar 2020 09:23:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CCEC12022EB0; Tue, 24 Mar 2020 13:23:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C87C82022EAB
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 13:23:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64D83185A790
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 13:23:38 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-237-puKntcYiNJ6ODvrqxRC1Jg-1; Tue, 24 Mar 2020 09:23:35 -0400
X-MC-Unique: puKntcYiNJ6ODvrqxRC1Jg-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02ODNZi6011310; Tue, 24 Mar 2020 13:23:35 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by aserp2120.oracle.com with ESMTP id 2ywavm47ua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2020 13:23:34 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02ODNYlH115932; Tue, 24 Mar 2020 13:23:34 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3020.oracle.com with ESMTP id 2yxw6mpyds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2020 13:23:34 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02ODNQSF031276;
	Tue, 24 Mar 2020 13:23:26 GMT
Received: from localhost.localdomain (/114.88.246.185)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 24 Mar 2020 06:23:25 -0700
From: Bob Liu <bob.liu@oracle.com>
To: dm-devel@redhat.com
Date: Tue, 24 Mar 2020 21:22:45 +0800
Message-Id: <20200324132245.27843-1-bob.liu@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9569
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
	adultscore=0
	malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
	phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003240072
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9569
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
	malwarescore=0
	priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1011 impostorscore=0
	phishscore=0 suspectscore=1 mlxlogscore=999 spamscore=0
	lowpriorityscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003240072
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02ODNeS7021735
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 25 Mar 2020 04:12:59 -0400
Cc: Damien.LeMoal@wdc.com, snitzer@redhat.com, Dmitry.Fomichev@wdc.com,
	stable@vger.kernel.org, linux-block@vger.kernel.org,
	Bob Liu <bob.liu@oracle.com>
Subject: [dm-devel] [PATCH resend] dm zoned: remove duplicated nr_rnd_zones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Cc: stable@vger.kernel.org
Fixes: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
Signed-off-by: Bob Liu <bob.liu@oracle.com>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
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

