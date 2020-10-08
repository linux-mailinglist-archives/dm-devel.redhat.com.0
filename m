Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 91DD0287D4E
	for <lists+dm-devel@lfdr.de>; Thu,  8 Oct 2020 22:41:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-74vYnJvMOb-22nTAaRsGkA-1; Thu, 08 Oct 2020 16:41:14 -0400
X-MC-Unique: 74vYnJvMOb-22nTAaRsGkA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 913741074647;
	Thu,  8 Oct 2020 20:41:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D0B819D7C;
	Thu,  8 Oct 2020 20:41:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D37408C7C1;
	Thu,  8 Oct 2020 20:41:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 098KeqmZ024644 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 8 Oct 2020 16:40:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 138B1207A644; Thu,  8 Oct 2020 20:40:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E36A2049CB7
	for <dm-devel@redhat.com>; Thu,  8 Oct 2020 20:40:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B65CD1021F60
	for <dm-devel@redhat.com>; Thu,  8 Oct 2020 20:40:49 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-519-Z-Ou3GrTMyKiGmDJClXQ0g-1; Thu, 08 Oct 2020 16:40:47 -0400
X-MC-Unique: Z-Ou3GrTMyKiGmDJClXQ0g-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	098Kdfkl057454; Thu, 8 Oct 2020 20:40:30 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2120.oracle.com with ESMTP id 3429jmg5ab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 08 Oct 2020 20:40:30 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	098KYtwb087014; Thu, 8 Oct 2020 20:40:30 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3020.oracle.com with ESMTP id 3429kagsre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Oct 2020 20:40:29 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 098KeMso009103;
	Thu, 8 Oct 2020 20:40:22 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 08 Oct 2020 13:40:21 -0700
To: Christoph Hellwig <hch@lst.de>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1zh4w1mrq.fsf@ca-mkp.ca.oracle.com>
References: <CA+G9fYtwisRJtN4ht=ApeWc1jWssDok-7y2wee6Z0kzMP-atKg@mail.gmail.com>
	<CA+G9fYseTYRWoHUNZ=j4mjFs9dDJ-KOD8hDy+RnyDPx75HcVWw@mail.gmail.com>
	<24c8ee4d-d5f7-e49f-cd0c-7cf50a5fd885@kernel.dk>
	<20201008203058.GA27821@lst.de>
Date: Thu, 08 Oct 2020 16:40:18 -0400
In-Reply-To: <20201008203058.GA27821@lst.de> (Christoph Hellwig's message of
	"Thu, 8 Oct 2020 22:30:58 +0200")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9768
	signatures=668681
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
	adultscore=0
	phishscore=0 spamscore=0 mlxscore=0 malwarescore=0 bulkscore=0
	mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2009150000 definitions=main-2010080145
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9768
	signatures=668681
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
	spamscore=0 suspectscore=1
	clxscore=1011 phishscore=0 lowpriorityscore=0 impostorscore=0
	malwarescore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
	bulkscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2009150000 definitions=main-2010080146
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>, Stephen,
	martin.petersen@oracle.com, Song Liu <song@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>, Hannes,
	linux-mmc <linux-mmc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
	linux-block <linux-block@vger.kernel.org>, "open
	list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
	<linux-ide@vger.kernel.org>, dm-devel@redhat.com,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	drbd-dev@tron.linbit.com, Rothwell <sfr@canb.auug.org.au>
Subject: Re: [dm-devel] [ Regressions ] linux next 20201008:
 blk_update_request: I/O error, dev sda,
 sector 0 op 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 0
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Christoph,

> On Thu, Oct 08, 2020 at 02:17:41PM -0600, Jens Axboe wrote:
>> Just for everyones edification, that would be these 9 patches from the
>> SCSI tree:
>
> I sent the fixes out a bit ago and Cced the reporters..

I do not have any libata-connected devices in the SCSI test setup so
things worked fine for me yesterday. I have a retired Nehalem server in
the rack which has a couple of ATA 500GB disk drives in it. I'll try to
see if I can add that to my test pool. Just for good measure.

In any case the fixes are now in my for-next branch:

b6ba9b0e201a scsi: core: Set sc_data_direction to DMA_NONE for no-transfer commands
9120ac54cce6 scsi: sr: Initialize ->cmd_len

-- 
Martin K. Petersen	Oracle Linux Engineering

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

