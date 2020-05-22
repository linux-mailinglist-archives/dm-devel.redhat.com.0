Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED621E0C9B
	for <lists+dm-devel@lfdr.de>; Mon, 25 May 2020 13:14:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590405239;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dUT2cjBXxfwiDgA8Qy6h6Oxs3fV0foQoNVTz/dMMrF0=;
	b=dW8uiMsh1jtUlQxywJebz2xMQyV2fLOfrOcsAK8dFJGt5CUAXT6UJWSgeDc4YqJRb8avmw
	XvzAozOmYlz2ECAxYDQ0+TCg8AhqSI9eP2qziaGUfnd17IEWETQiN0lhhKqaauJTlI1jKA
	kmT+8QiEuKXfz0ShaCn4ORAAsbQq3WU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-SQfQv55mNjO1dhSW6JJJ1w-1; Mon, 25 May 2020 07:13:56 -0400
X-MC-Unique: SQfQv55mNjO1dhSW6JJJ1w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C19B107ACF4;
	Mon, 25 May 2020 11:13:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A537019D7E;
	Mon, 25 May 2020 11:13:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5FAFD1809543;
	Mon, 25 May 2020 11:13:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04MEEwB7006065 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 May 2020 10:14:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8EA2FF1C95; Fri, 22 May 2020 14:14:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A76BF1C91
	for <dm-devel@redhat.com>; Fri, 22 May 2020 14:14:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34691862F6B
	for <dm-devel@redhat.com>; Fri, 22 May 2020 14:14:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-358-7301XgRePb2vsskzTAFr0w-1;
	Fri, 22 May 2020 10:14:51 -0400
X-MC-Unique: 7301XgRePb2vsskzTAFr0w-1
Received: from dhcp-10-100-145-180.wdl.wdc.com (unknown [199.255.45.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6BFF62225D;
	Fri, 22 May 2020 14:14:49 +0000 (UTC)
Date: Fri, 22 May 2020 07:14:47 -0700
From: Keith Busch <kbusch@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Message-ID: <20200522141447.GB3423299@dhcp-10-100-145-180.wdl.wdc.com>
References: <20200514065819.1113949-1-damien.lemoal@wdc.com>
	<BY5PR04MB6900144BD2729172EBF5DF2EE7B40@BY5PR04MB6900.namprd04.prod.outlook.com>
	<yq1lflkp0b9.fsf@ca-mkp.ca.oracle.com>
	<yq1ftbsp06e.fsf@ca-mkp.ca.oracle.com>
MIME-Version: 1.0
In-Reply-To: <yq1ftbsp06e.fsf@ca-mkp.ca.oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 25 May 2020 07:13:20 -0400
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <Damien.LeMoal@wdc.com>,
	Mike Snitzer <snitzer@redhat.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] block: Improve io_opt limit stacking
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, May 22, 2020 at 09:36:18AM -0400, Martin K. Petersen wrote:
> 
> >>> +	if (t->io_opt & (t->physical_block_size - 1))
> >>> +		t->io_opt = lcm(t->io_opt, t->physical_block_size);
> >
> >> Any comment on this patch ?  Note: the patch the patch "nvme: Fix
> >> io_opt limit setting" is already queued for 5.8.
> >
> > Setting io_opt to the physical block size is not correct.
> 
> Oh, missed the lcm(). But I'm still concerned about twiddling io_opt to
> a value different than the one reported by an underlying device.
>
> Setting io_opt to something that's less than a full stripe width in a
> RAID, for instance, doesn't produce the expected result. So I think I'd
> prefer not to set io_opt at all if it isn't consistent across all the
> stacked devices.

We already modify the stacked io_opt value if the two request_queues
report different io_opt's. If, however, only one reports an io_opt value,
and it happens to not align with the other's physical block size, the
code currently rejects stacking those devices. Damien's patch should
just set a larger io_opt value that aligns with both, so if one io_opt
is a RAID stripe size, the stacked result will be multiple stripes.

I think that makes sense, but please do let us know if you think such
mismatched devices just shouldn't stack.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

