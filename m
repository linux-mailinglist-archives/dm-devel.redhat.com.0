Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E053B3EFE58
	for <lists+dm-devel@lfdr.de>; Wed, 18 Aug 2021 09:57:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-q18DJRwGMAWSJ3vKf25bSQ-1; Wed, 18 Aug 2021 03:57:04 -0400
X-MC-Unique: q18DJRwGMAWSJ3vKf25bSQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDE61802929;
	Wed, 18 Aug 2021 07:56:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B54DC6A8FC;
	Wed, 18 Aug 2021 07:56:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B562181A0F8;
	Wed, 18 Aug 2021 07:56:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17HM2bkx026298 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 17 Aug 2021 18:02:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4867D100335C; Tue, 17 Aug 2021 22:02:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4490E1111C90
	for <dm-devel@redhat.com>; Tue, 17 Aug 2021 22:02:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2592100B8C8
	for <dm-devel@redhat.com>; Tue, 17 Aug 2021 22:02:34 +0000 (UTC)
Received: from mail-1.ca.inter.net (mail-1.ca.inter.net [208.85.220.69]) by
	relay.mimecast.com with ESMTP id us-mta-252-LFwhWNkVP2KJMArPuIRiiw-1;
	Tue, 17 Aug 2021 18:02:30 -0400
X-MC-Unique: LFwhWNkVP2KJMArPuIRiiw-1
Received: from mp-mx11.ca.inter.net (mp-mx11.ca.inter.net [208.85.217.19])
	by mail-1.ca.inter.net (Postfix) with ESMTP id 8E3912EA3C6;
	Tue, 17 Aug 2021 17:53:50 -0400 (EDT)
Received: from mail-1.ca.inter.net ([208.85.220.69])
	by mp-mx11.ca.inter.net (mp-mx11.ca.inter.net [208.85.217.19])
	(amavisd-new, port 10024)
	with ESMTP id OvSH92nd_r9u; Tue, 17 Aug 2021 17:53:49 -0400 (EDT)
Received: from [192.168.48.23] (host-45-78-207-107.dyn.295.ca [45.78.207.107])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: dgilbert@interlog.com)
	by mail-1.ca.inter.net (Postfix) with ESMTPSA id DC7C52EA1C8;
	Tue, 17 Aug 2021 17:53:45 -0400 (EDT)
To: Mikulas Patocka <mpatocka@redhat.com>, Bart Van Assche <bvanassche@acm.org>
References: <20210817101423.12367-1-selvakuma.s1@samsung.com>
	<CGME20210817101758epcas5p1ec353b3838d64654e69488229256d9eb@epcas5p1.samsung.com>
	<20210817101423.12367-4-selvakuma.s1@samsung.com>
	<ad3561b9-775d-dd4d-0d92-6343440b1f8f@acm.org>
	<alpine.LRH.2.02.2108171630120.30363@file01.intranet.prod.int.rdu2.redhat.com>
From: Douglas Gilbert <dgilbert@interlog.com>
Message-ID: <bbecc7e7-8bf5-3fe3-6c24-883c79fb7517@interlog.com>
Date: Tue, 17 Aug 2021 17:53:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2108171630120.30363@file01.intranet.prod.int.rdu2.redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 18 Aug 2021 03:56:53 -0400
Cc: Mike Snitzer <snitzer@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	djwong@kernel.org, linux-nvme@lists.infradead.org,
	dm-devel@redhat.com, hch@lst.de, agk@redhat.com,
	linux-scsi@vger.kernel.org, nitheshshetty@gmail.com,
	willy@infradead.org, nj.shetty@samsung.com, kch@kernel.org,
	SelvaKumar S <selvakuma.s1@samsung.com>, selvajove@gmail.com,
	linux-block@vger.kernel.org, javier.gonz@samsung.com,
	kbusch@kernel.org, axboe@kernel.dk, damien.lemoal@wdc.com,
	joshi.k@samsung.com, "Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-api@vger.kernel.org, johannes.thumshirn@wdc.com,
	linux-fsdevel@vger.kernel.org, joshiiitr@gmail.com, asml.silence@gmail.com
Subject: Re: [dm-devel] [PATCH 3/7] block: copy offload support
	infrastructure
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: dgilbert@interlog.com
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 2021-08-17 4:41 p.m., Mikulas Patocka wrote:
> 
> 
> On Tue, 17 Aug 2021, Bart Van Assche wrote:
> 
>> On 8/17/21 3:14 AM, SelvaKumar S wrote:
>>> Introduce REQ_OP_COPY, a no-merge copy offload operation. Create
>>> bio with control information as payload and submit to the device.
>>> Larger copy operation may be divided if necessary by looking at device
>>> limits. REQ_OP_COPY(19) is a write op and takes zone_write_lock when
>>> submitted to zoned device.
>>> Native copy offload is not supported for stacked devices.
>>
>> Using a single operation for copy-offloading instead of separate operations
>> for reading and writing is fundamentally incompatible with the device mapper.
>> I think we need a copy-offloading implementation that is compatible with the
>> device mapper.
> 
> I once wrote a copy offload implementation that is compatible with device
> mapper. The copy operation creates two bios (one for reading and one for
> writing), passes them independently through device mapper and pairs them
> at the physical device driver.
> 
> It's here: http://people.redhat.com/~mpatocka/patches/kernel/xcopy/current

In my copy solution the read-side and write-side bio pairs share the same 
storage (i.e. ram) This gets around the need to copy data between the bio_s.
See:
    https://sg.danny.cz/sg/sg_v40.html
in Section 8 on Request sharing. This technique can be efficiently extend to
source --> destination1,destination2,...      copies.

Doug Gilbert

> I verified that it works with iSCSI. Would you be interested in continuing
> this work?
> 
> Mikulas
> 
>> Storing the parameters of the copy operation in the bio payload is
>> incompatible with the current implementation of bio_split().
>>
>> In other words, I think there are fundamental problems with this patch series.
>>
>> Bart.
>>
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

