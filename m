Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D25D3227069
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 23:36:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-lvkOTfGDPPiPXXr6_gD5-g-1; Mon, 20 Jul 2020 17:36:21 -0400
X-MC-Unique: lvkOTfGDPPiPXXr6_gD5-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4DC5800597;
	Mon, 20 Jul 2020 21:36:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 436911992F;
	Mon, 20 Jul 2020 21:36:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D4F229A153;
	Mon, 20 Jul 2020 21:36:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06KLZrTt019741 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 17:35:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 50DAF2156A4D; Mon, 20 Jul 2020 21:35:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BA682156A4A
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 21:35:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB95385A5B2
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 21:35:50 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
	[209.85.166.178]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-150-wwgUtV9BPHCrapyzPn4dbg-1; Mon, 20 Jul 2020 17:35:48 -0400
X-MC-Unique: wwgUtV9BPHCrapyzPn4dbg-1
Received: by mail-il1-f178.google.com with SMTP id x9so14634652ila.3
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 14:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=y4WvrFF4oT60WCYFzoEKcEPOboTCnMH1fSK6qyG/Ly4=;
	b=o6WSPCF5tgdkdneOnh92plwG8QbXgTvAGYVBav2by+yy3ICBCvUkuxXSkGxO7QAU5i
	cUNulpbKJGOh1mQl8ZjQjxlUoIStsKJ5/8nru9NIjZuRUJVT8CTwXKO4tffi44trc+Yl
	lzn9ilHQxT++FgKKTXd3fZhEN5MnLX29Pb40I4zzOVQahcWnrU7wvH1E8CDjiT3CStzX
	+n3YWNp/sd8dJs+oXBNyTlmnhclNQf/OitirHxep1XDlY9nAVr++HCyJNhW7zYcV//n4
	iokqhedxi+7FNT3NcI2D8j0AAfASFUhlJvFvzccn6MmpXK8PFgyhqHSkCaP/6q3WXw8Q
	udpA==
X-Gm-Message-State: AOAM530HRZvvBVLPIUSliVHzHpw7Pi268TzCxUhGjv4suWfk9IbM59/p
	7502QMKzsnoKasHGsg4nOgP9XFtexpCrqQ==
X-Google-Smtp-Source: ABdhPJzfbtVS2ywymY14m6Uc8uJPxy+acgbORpzyzeKQBWPDwVaDILjxcWyHjBgsOE25AY9kZzSQtA==
X-Received: by 2002:a05:6e02:4ca:: with SMTP id
	f10mr25177577ils.291.1595280945704; 
	Mon, 20 Jul 2020 14:35:45 -0700 (PDT)
Received: from [192.168.1.58] ([65.144.74.34])
	by smtp.gmail.com with ESMTPSA id
	c77sm9628425ill.13.2020.07.20.14.35.44
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 20 Jul 2020 14:35:45 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20200720061251.652457-1-hch@lst.de>
	<dfe56cf2-db3d-3461-9834-be314f4080ef@kernel.dk>
	<20200720173530.GA21442@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <ab942c19-68c3-2a76-b3b2-136a2bf3ca54@kernel.dk>
Date: Mon, 20 Jul 2020 15:35:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720173530.GA21442@lst.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Damien.LeMoal@wdc.com, dm-devel@redhat.com
Subject: Re: [dm-devel] a fix and two cleanups around blk_stack_limits
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

On 7/20/20 11:35 AM, Christoph Hellwig wrote:
> On Mon, Jul 20, 2020 at 10:56:23AM -0600, Jens Axboe wrote:
>> On 7/20/20 12:12 AM, Christoph Hellwig wrote:
>>> Hi Jens,
>>>
>>> this series ensures that the zoned device limitations are properly
>>> inherited in blk_stack_limits, and then cleanups up two rather
>>> pointless wrappers around it.
>>
>> We should probably make this against for-5.9/drivers instead, to avoid
>> an unnecessary conflict when merging.
> 
> Then we'd also need a merge as my next series depends on this, and it
> clearly is core material.  Not sure which one is more important.

Hmm, might make more sense to kick off a branch topic for this and just
merge it after the other ones.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

