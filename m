Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4FA277616
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 18:00:39 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-C0wd9hBYPfa_hXDq1eBd1Q-1; Thu, 24 Sep 2020 12:00:35 -0400
X-MC-Unique: C0wd9hBYPfa_hXDq1eBd1Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58C2610BBED3;
	Thu, 24 Sep 2020 16:00:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6FCB702E7;
	Thu, 24 Sep 2020 16:00:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C770944A5E;
	Thu, 24 Sep 2020 16:00:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OFx2EQ011889 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 11:59:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BC4451009BB5; Thu, 24 Sep 2020 15:59:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7D001009BB6
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 15:59:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06238811E7F
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 15:59:00 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-428-oLeYKcyUO-ijEdF2YWhHkw-1; Thu, 24 Sep 2020 11:58:57 -0400
X-MC-Unique: oLeYKcyUO-ijEdF2YWhHkw-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08OFZKn1125757; Thu, 24 Sep 2020 15:58:55 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2120.oracle.com with ESMTP id 33q5rgqgv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 24 Sep 2020 15:58:55 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08OFVTIt126538; Thu, 24 Sep 2020 15:58:54 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3030.oracle.com with ESMTP id 33nux304s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Sep 2020 15:58:54 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08OFwmqU022820;
	Thu, 24 Sep 2020 15:58:48 GMT
MIME-Version: 1.0
Message-ID: <17ff78d3-2ef3-414b-8168-2a2f603fcec0@default>
Date: Thu, 24 Sep 2020 08:58:47 -0700 (PDT)
From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
To: Mike Snitzer <snitzer@redhat.com>
References: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
	<3be1ea32-b6a8-41ef-a9ba-ed691434d068@default>
	<20200924012732.GA10766@redhat.com>
In-Reply-To: <20200924012732.GA10766@redhat.com>
X-Priority: 3
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	mlxscore=0 adultscore=0
	bulkscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009240118
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	impostorscore=0
	clxscore=1011 suspectscore=0 phishscore=0 malwarescore=0
	priorityscore=1501 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
	lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009240118
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08OFx2EQ011889
X-loop: dm-devel@redhat.com
Cc: Damien.LeMoal@wdc.com, ssudhakarp@gmail.com,
	Martin Petersen <martin.petersen@oracle.com>, dm-crypt@saout.de,
	dm-devel@redhat.com, Shirley Ma <shirley.ma@oracle.com>,
	mpatocka@redhat.com, Milan Broz <gmazyland@gmail.com>, agk@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Mike,

> -----Original Message-----
> From: Mike Snitzer [mailto:snitzer@redhat.com]
> Sent: Wednesday, September 23, 2020 7:28 PM
> To: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
> Cc: agk@redhat.com; dm-devel@redhat.com; dm-crypt@saout.de;
> mpatocka@redhat.com; Damien.LeMoal@wdc.com; Shirley Ma
> <shirley.ma@oracle.com>; ssudhakarp@gmail.com; Martin Petersen
> <martin.petersen@oracle.com>; Milan Broz <gmazyland@gmail.com>
> Subject: Re: [RFC PATCH 0/2] dm crypt: Allow unaligned buffer lengths for
> skcipher devices
> 
> You've clearly done a nice job with these changes.  Looks clean.

Thanks.

> 
> BUT, I'm struggling to just accept that dm-crypt needs to go to these
> extra lengths purely because of one bad apple usecase.

During my initial stages of investigation, I had the same impression as yours, but digging further, I felt fixing dm-crypt would be more appropriate.

In the following two test cases, windows installation/formatting/booting, all were successful.

Windows Guest <--> Vhost-Scsi <--> LIO(scsi/target/blockio) <--> iSCSI block device
Windows Guest <--> Vhost-Scsi <--> LIO(scsi/target/blockio) <--> Local MegaRaid Block Device

When I inserted dm-crypt in the IO path, that is where I noticed windows boot/install/format failures. The IO path is like this:

Windows Guest <--> Vhost-Scsi <--> LIO(scsi/target/blockio) <-->  dm-crypt <--> iSCSI block device

After these tests, I realized that, when every other component in the IO stack can handle unaligned bio lengths, why can't make dm-crypt handle the same. Hence, the patch.
 
> 
> These alignment constraints aren't new.  Are there other portions of
> Linux's crypto subsystem that needed comparable fixes in order to work
> with Microsfot OS initiated IO through a guest?

I ran basic test with "--cipher aes-xts-plain64" and verified the fix. Also, noticed that the crypto subsystem uses APIs in crypto/skcipher.c which are already specifically written to handle unaligned buffers.

> 
> You forecast that these same kinds of changes are needed for AEAD and
> dm-integrity... that's alarming.

I understand the concern. I have tried to ensure the patch doesn't result in degrade in performance for the Linux use case. If at all, there is any performance impact due to this change, it will be only for windows(I didn't see any performance drop in my test, though).

Thanks
Sudhakar

> 
> Are we _certain_ there is no other way forward?
> (Sorry I don't have suggestions.. I'm in "fact finding mode" ;)
> 
> Thanks,
> Mike
> 
> On Wed, Sep 23 2020 at  1:01pm -0400,
> Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com> wrote:
> 
> > Could someone review this patch set, please?
> >
> > Thanks
> > Sudhakar
> >
> > > -----Original Message-----
> > > From: Sudhakar Panneerselvam
> > > Sent: Wednesday, September 16, 2020 12:40 PM
> > > To: agk@redhat.com; snitzer@redhat.com; dm-devel@redhat.com
> > > Cc: Shirley Ma <shirley.ma@oracle.com>; ssudhakarp@gmail.com; Martin
> > > Petersen <martin.petersen@oracle.com>
> > > Subject: [dm-devel] [RFC PATCH 0/2] dm crypt: Allow unaligned buffer
> lengths
> > > for skcipher devices
> > >
> > > Hi,
> > >
> > > This changeset allows processing of unaligned bio requests in dm crypt
> > > for the I/Os generated from a windows guest OS in a QEMU environment.
> If
> > > this changeset is accepted, then I will be submitting another changeset that
> > > addresses the similar issue in AEAD disks and dm-integrity module.
> > >
> > > Thanks
> > > Sudhakar
> > >
> > > Sudhakar Panneerselvam (2):
> > >   dm crypt: Allow unaligned bio buffer lengths for skcipher devices
> > >   dm crypt: Handle unaligned bio buffer lengths for lmk and tcw
> > >
> > >  drivers/md/dm-crypt.c | 154
> +++++++++++++++++++++++++++++++++++----
> > > -----------
> > >  1 file changed, 108 insertions(+), 46 deletions(-)
> > >
> > > --
> > > 1.8.3.1
> > >
> > > --
> > > dm-devel mailing list
> > > dm-devel@redhat.com
> > > https://www.redhat.com/mailman/listinfo/dm-devel
> > >
> >
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

