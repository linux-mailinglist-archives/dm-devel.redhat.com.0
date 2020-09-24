Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 682A227778A
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 19:15:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-x5VTVtLwMraxCrCtd08k0Q-1; Thu, 24 Sep 2020 13:15:17 -0400
X-MC-Unique: x5VTVtLwMraxCrCtd08k0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 605E3800475;
	Thu, 24 Sep 2020 17:15:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78CD97368B;
	Thu, 24 Sep 2020 17:15:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58E4579DA9;
	Thu, 24 Sep 2020 17:15:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OHEwrZ022879 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 13:14:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 887BF115DB2; Thu, 24 Sep 2020 17:14:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83B6D115DB1
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 17:14:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23B22811E76
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 17:14:55 +0000 (UTC)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-431-xIRgqlNPMtKOL-5-bRNeIw-1; Thu, 24 Sep 2020 13:14:50 -0400
X-MC-Unique: xIRgqlNPMtKOL-5-bRNeIw-1
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08OHDpFM002929; Thu, 24 Sep 2020 17:14:48 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by aserp2130.oracle.com with ESMTP id 33qcpu6g4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 24 Sep 2020 17:14:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08OHAci8141576; Thu, 24 Sep 2020 17:12:47 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3020.oracle.com with ESMTP id 33nurwf7xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Sep 2020 17:12:47 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08OHCj6I000351;
	Thu, 24 Sep 2020 17:12:45 GMT
MIME-Version: 1.0
Message-ID: <0b18d5a9-5bf3-41fb-9766-7f4b75019067@default>
Date: Thu, 24 Sep 2020 10:12:44 -0700 (PDT)
From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
To: Mikulas Patocka <mpatocka@redhat.com>
References: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
	<3be1ea32-b6a8-41ef-a9ba-ed691434d068@default>
	<alpine.LRH.2.02.2009240834020.11084@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2009240834020.11084@file01.intranet.prod.int.rdu2.redhat.com>
X-Priority: 3
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9754
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
	malwarescore=0
	phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=0
	spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009240127
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9754
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	mlxlogscore=999
	adultscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
	priorityscore=1501
	phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009240127
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08OHEwrZ022879
X-loop: dm-devel@redhat.com
Cc: Damien.LeMoal@wdc.com, ssudhakarp@gmail.com, snitzer@redhat.com,
	dm-crypt@saout.de, dm-devel@redhat.com, Shirley Ma <shirley.ma@oracle.com>,
	Martin Petersen <martin.petersen@oracle.com>, agk@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Mikulas,

> -----Original Message-----
> From: Mikulas Patocka [mailto:mpatocka@redhat.com]
> Sent: Thursday, September 24, 2020 6:40 AM
> To: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
> Cc: agk@redhat.com; snitzer@redhat.com; dm-devel@redhat.com; dm-
> crypt@saout.de; Damien.LeMoal@wdc.com; Shirley Ma
> <shirley.ma@oracle.com>; ssudhakarp@gmail.com; Martin Petersen
> <martin.petersen@oracle.com>
> Subject: RE: [dm-devel] [RFC PATCH 0/2] dm crypt: Allow unaligned buffer
> lengths for skcipher devices
> 
> 
> 
> On Wed, 23 Sep 2020, Sudhakar Panneerselvam wrote:
> 
> > Could someone review this patch set, please?
> >
> > Thanks
> > Sudhakar
> 
> Hi
> 
> I'd like to ask - what sector size do you use in dm-crypt? Could the issue
> be fixed just by using the smallest possible 512-byte sectors?

My test has been with 512 bytes sector length. 

> 
> What I/O method does qemu use? Is it direct i/o + aio? What is unaligned -
> the base address? Or length? Or the sector number? Could you use strace on
> qemu and show an example of an I/O that fails due to alignment?

Please see my update on June 11 @ https://github.com/virtio-win/kvm-guest-drivers-windows/issues/446 when I originally posted this issue to windows virtio forum. It has some finer details of the reproduction steps and might answer some of your questions.

Also, please see my reply to Eric's email on some of the low level details of function call sequence leading to the issue. If there are further questions, let me know.

Thanks
Sudhakar

> 
> Mikulas
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

