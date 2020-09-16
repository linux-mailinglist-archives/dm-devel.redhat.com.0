Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2510526CC84
	for <lists+dm-devel@lfdr.de>; Wed, 16 Sep 2020 22:45:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-vazG9QLIM8Gazdi08yGUiA-1; Wed, 16 Sep 2020 16:45:46 -0400
X-MC-Unique: vazG9QLIM8Gazdi08yGUiA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1494E1882FB0;
	Wed, 16 Sep 2020 20:45:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3FC65DE77;
	Wed, 16 Sep 2020 20:45:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C3C25183D03A;
	Wed, 16 Sep 2020 20:45:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GKhu6x026669 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 16:43:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 32C5D2166B27; Wed, 16 Sep 2020 20:43:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D9FD2142F49
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 20:43:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D047388FA29
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 20:43:53 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-140-3WVlRUAQNiKXVpvRu4dMng-3; Wed, 16 Sep 2020 16:43:51 -0400
X-MC-Unique: 3WVlRUAQNiKXVpvRu4dMng-3
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08GIaHvR124285; Wed, 16 Sep 2020 18:40:15 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2120.oracle.com with ESMTP id 33j91dpg15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 16 Sep 2020 18:40:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08GIPVnn061721; Wed, 16 Sep 2020 18:40:14 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3020.oracle.com with ESMTP id 33h8890kje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Sep 2020 18:40:14 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08GIeEVY012682;
	Wed, 16 Sep 2020 18:40:14 GMT
Received: from supannee-devvm-ol7.osdevelopmeniad.oraclevcn.com
	(/100.100.231.179) by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 16 Sep 2020 18:40:13 +0000
From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
To: agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com
Date: Wed, 16 Sep 2020 18:40:04 +0000
Message-Id: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746
	signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
	spamscore=0 adultscore=0
	suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=908
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009160130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746
	signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	impostorscore=0
	priorityscore=1501 malwarescore=0 suspectscore=0 mlxlogscore=940
	clxscore=1011 adultscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: shirley.ma@oracle.com, ssudhakarp@gmail.com, martin.petersen@oracle.com
Subject: [dm-devel] [RFC PATCH 0/2] dm crypt: Allow unaligned buffer lengths
	for skcipher devices
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

This changeset allows processing of unaligned bio requests in dm crypt
for the I/Os generated from a windows guest OS in a QEMU environment. If
this changeset is accepted, then I will be submitting another changeset that
addresses the similar issue in AEAD disks and dm-integrity module.

Thanks
Sudhakar

Sudhakar Panneerselvam (2):
  dm crypt: Allow unaligned bio buffer lengths for skcipher devices
  dm crypt: Handle unaligned bio buffer lengths for lmk and tcw

 drivers/md/dm-crypt.c | 154 +++++++++++++++++++++++++++++++++++---------------
 1 file changed, 108 insertions(+), 46 deletions(-)

-- 
1.8.3.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

