Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 564E12777EC
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 19:39:02 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-eBvr4tYgPGaoqbKhdPZ9GA-1; Thu, 24 Sep 2020 13:38:59 -0400
X-MC-Unique: eBvr4tYgPGaoqbKhdPZ9GA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B27CD807352;
	Thu, 24 Sep 2020 17:38:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8236055786;
	Thu, 24 Sep 2020 17:38:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C0181826D2A;
	Thu, 24 Sep 2020 17:38:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OHce8x026110 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 13:38:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D409C2142F48; Thu, 24 Sep 2020 17:38:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF1912166B27
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 17:38:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B685B811E7F
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 17:38:37 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-557-lL12pxiOP5qRq2LCnXPaVg-1; Thu, 24 Sep 2020 13:38:33 -0400
X-MC-Unique: lL12pxiOP5qRq2LCnXPaVg-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08OHZpwY007456; Thu, 24 Sep 2020 17:38:29 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by userp2120.oracle.com with ESMTP id 33ndnusqr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 24 Sep 2020 17:38:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08OHZShi120238; Thu, 24 Sep 2020 17:38:29 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by userp3030.oracle.com with ESMTP id 33nux35d4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Sep 2020 17:38:29 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08OHcR9n018107;
	Thu, 24 Sep 2020 17:38:27 GMT
MIME-Version: 1.0
Message-ID: <7b6fdfd5-0160-4bcf-b7ed-d0e51553c678@default>
Date: Thu, 24 Sep 2020 10:38:26 -0700 (PDT)
From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
To: Mikulas Patocka <mpatocka@redhat.com>
References: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
	<3be1ea32-b6a8-41ef-a9ba-ed691434d068@default>
	<20200924012732.GA10766@redhat.com>
	<20200924051419.GA16103@sol.localdomain>
	<252587bb-c0b7-47c9-a97b-91422f8f9c47@default>
	<alpine.LRH.2.02.2009241314280.28814@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2009241314280.28814@file01.intranet.prod.int.rdu2.redhat.com>
X-Priority: 3
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9754
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	mlxscore=0 adultscore=0
	bulkscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009240130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9754
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
	clxscore=1015 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009240130
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08OHce8x026110
X-loop: dm-devel@redhat.com
Cc: Damien.LeMoal@wdc.com, ssudhakarp@gmail.com,
	Mike Snitzer <snitzer@redhat.com>, dm-crypt@saout.de,
	Eric Biggers <ebiggers@kernel.org>, dm-devel@redhat.com,
	Ma <shirley.ma@oracle.com>,
	Martin Petersen <martin.petersen@oracle.com>, Shirley,
	Milan Broz <gmazyland@gmail.com>, agk@redhat.com
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

Hi Mikulas,

> > Windows Guest <--> Vhost-Scsi <--> LIO(scsi/target/blockio) <-->  dm-crypt
> <--> iSCSI block device
> >
> > One real example out of my debugging: Windows sends a I/O request with
> > 6656 bytes to vhost-scsi interface. Vhost-scsi uses translate_desc() in
> > drivers/vhost/vhost.c to convert windows user space memory buffers to
> > kernel iovecs. Vhost-scsi then converts the iovecs to sg entries in
> > vhost_scsi_mapal() which is then handed over to "target" subsystem and
> > eventually submitted to dm-crypt. This 6656 bytes IO has got 3 segments,
> > first segment had 1584, second 4096 and the last had 976 bytes. Dm-crypt
> > rejects the I/O after seeing the first segment length 1584 which is not
> > a 512 byte multiple.
> >
> > Let me know if there are further questions.
> >
> > Thanks
> > Sudhakar
> 
> Hi
> 
> I think it should be fixed in vhost-scsi.

In the above example of 6656 bytes I/O, windows allocates 6656 bytes virtually contiguous I/O. This IO, when it lands in the kernel, translates to 3 physically discontiguous pages, that's why translate_desc() had to create 3 iovecs to handle this I/O. I don't understand how vhost-scsi could have solved this issue. Only other possibility I see is to have windows fix it by always sending 512 byte aligned buffer lengths, but going with my earlier point that every other component in the Linux IO path handles this case well except for dm-crypt, so it make more sense to fix it in dm-crypt.

Thanks
Sudhakar

> 
> Mikulas
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

