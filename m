Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 53BD127635D
	for <lists+dm-devel@lfdr.de>; Wed, 23 Sep 2020 23:53:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-W5cICEJ7OE60aVsspvXJtQ-1; Wed, 23 Sep 2020 17:53:02 -0400
X-MC-Unique: W5cICEJ7OE60aVsspvXJtQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A0CD1007464;
	Wed, 23 Sep 2020 21:52:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EAB755768;
	Wed, 23 Sep 2020 21:52:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F9C6183D040;
	Wed, 23 Sep 2020 21:52:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08NLqQ5g009669 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 17:52:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AF180201828C; Wed, 23 Sep 2020 21:52:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A79C72026F94
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 21:52:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F1ED80121D
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 21:52:20 +0000 (UTC)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-566-fQGn9Q1rOhma4L-wk6liBg-1; Wed, 23 Sep 2020 17:52:16 -0400
X-MC-Unique: fQGn9Q1rOhma4L-wk6liBg-1
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08NH3h5J056452; Wed, 23 Sep 2020 17:03:53 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2130.oracle.com with ESMTP id 33qcpu0nrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 23 Sep 2020 17:03:52 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08NH0Jas118914; Wed, 23 Sep 2020 17:01:52 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3020.oracle.com with ESMTP id 33r28vwa39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Sep 2020 17:01:52 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08NH1kTr012934;
	Wed, 23 Sep 2020 17:01:46 GMT
MIME-Version: 1.0
Message-ID: <3be1ea32-b6a8-41ef-a9ba-ed691434d068@default>
Date: Wed, 23 Sep 2020 10:01:45 -0700 (PDT)
From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
To: agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com, dm-crypt@saout.de,
	mpatocka@redhat.com, Damien.LeMoal@wdc.com
References: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
In-Reply-To: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
X-Priority: 3
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
	mlxlogscore=999
	suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
	phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009230131
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	mlxlogscore=999
	adultscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
	priorityscore=1501
	phishscore=0 spamscore=0 malwarescore=0 clxscore=1011 impostorscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009230131
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08NLqQ5g009669
X-loop: dm-devel@redhat.com
Cc: Shirley Ma <shirley.ma@oracle.com>, ssudhakarp@gmail.com,
	Martin Petersen <martin.petersen@oracle.com>
Subject: Re: [dm-devel] [RFC PATCH 0/2] dm crypt: Allow unaligned buffer
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Could someone review this patch set, please?

Thanks
Sudhakar

> -----Original Message-----
> From: Sudhakar Panneerselvam
> Sent: Wednesday, September 16, 2020 12:40 PM
> To: agk@redhat.com; snitzer@redhat.com; dm-devel@redhat.com
> Cc: Shirley Ma <shirley.ma@oracle.com>; ssudhakarp@gmail.com; Martin
> Petersen <martin.petersen@oracle.com>
> Subject: [dm-devel] [RFC PATCH 0/2] dm crypt: Allow unaligned buffer lengths
> for skcipher devices
> 
> Hi,
> 
> This changeset allows processing of unaligned bio requests in dm crypt
> for the I/Os generated from a windows guest OS in a QEMU environment. If
> this changeset is accepted, then I will be submitting another changeset that
> addresses the similar issue in AEAD disks and dm-integrity module.
> 
> Thanks
> Sudhakar
> 
> Sudhakar Panneerselvam (2):
>   dm crypt: Allow unaligned bio buffer lengths for skcipher devices
>   dm crypt: Handle unaligned bio buffer lengths for lmk and tcw
> 
>  drivers/md/dm-crypt.c | 154 +++++++++++++++++++++++++++++++++++----
> -----------
>  1 file changed, 108 insertions(+), 46 deletions(-)
> 
> --
> 1.8.3.1
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

