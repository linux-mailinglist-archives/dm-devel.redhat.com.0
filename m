Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 27B7836532A
	for <lists+dm-devel@lfdr.de>; Tue, 20 Apr 2021 09:22:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-d36InXxNNpmFdphe9BsF8A-1; Tue, 20 Apr 2021 03:21:51 -0400
X-MC-Unique: d36InXxNNpmFdphe9BsF8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FF1F18C35D0;
	Tue, 20 Apr 2021 07:18:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6F31104254A;
	Tue, 20 Apr 2021 07:18:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 34EBD44A5C;
	Tue, 20 Apr 2021 07:18:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13K1Qc92032108 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 21:26:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BC394518C; Tue, 20 Apr 2021 01:26:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6D665CC0C
	for <dm-devel@redhat.com>; Tue, 20 Apr 2021 01:26:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7620E101A52C
	for <dm-devel@redhat.com>; Tue, 20 Apr 2021 01:26:35 +0000 (UTC)
Received: from mail-1.ca.inter.net (mail-1.ca.inter.net [208.85.220.69]) by
	relay.mimecast.com with ESMTP id us-mta-328--4j2LvpuN4uzDYj87besQg-1;
	Mon, 19 Apr 2021 21:26:33 -0400
X-MC-Unique: -4j2LvpuN4uzDYj87besQg-1
Received: from localhost (offload-3.ca.inter.net [208.85.220.70])
	by mail-1.ca.inter.net (Postfix) with ESMTP id 477922EA15D;
	Mon, 19 Apr 2021 21:20:42 -0400 (EDT)
Received: from mail-1.ca.inter.net ([208.85.220.69])
	by localhost (offload-3.ca.inter.net [208.85.220.70]) (amavisd-new,
	port 10024)
	with ESMTP id 1qZYRuf+pZPQ; Mon, 19 Apr 2021 21:01:03 -0400 (EDT)
Received: from [192.168.48.23] (host-45-58-219-4.dyn.295.ca [45.58.219.4])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: dgilbert@interlog.com)
	by mail-1.ca.inter.net (Postfix) with ESMTPSA id 9818B2EA124;
	Mon, 19 Apr 2021 21:20:41 -0400 (EDT)
To: Christoph Hellwig <hch@lst.de>, Damien Le Moal <damien.lemoal@wdc.com>
References: <20210417023323.852530-1-damien.lemoal@wdc.com>
	<20210417023323.852530-4-damien.lemoal@wdc.com>
	<20210419064529.GA19041@lst.de>
From: Douglas Gilbert <dgilbert@interlog.com>
Message-ID: <9a4d5090-1a70-129a-72f7-3699db0038a1@interlog.com>
Date: Mon, 19 Apr 2021 21:20:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210419064529.GA19041@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 20 Apr 2021 03:18:36 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>, dm-devel@redhat.com,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v2 3/3] zonefs: fix synchronous write to
 sequential zone files
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 2021-04-19 2:45 a.m., Christoph Hellwig wrote:
> On Sat, Apr 17, 2021 at 11:33:23AM +0900, Damien Le Moal wrote:
>> Synchronous writes to sequential zone files cannot use zone append
>> operations if the underlying zoned device queue limit
>> max_zone_append_sectors is 0, indicating that the device does not
>> support this operation. In this case, fall back to using regular write
>> operations.
> 
> Zone append is a mandatory feature of the zoned device API.

So a hack required for ZNS and not needed by ZBC and ZAC becomes
a "mandatory feature" in a Linux API. Like many hacks, that one might
come back to bite you :-)

Doug Gilbert

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

