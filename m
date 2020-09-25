Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 079D9278AC6
	for <lists+dm-devel@lfdr.de>; Fri, 25 Sep 2020 16:20:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-2iIh0RSKMXuqUE33YXMKUg-1; Fri, 25 Sep 2020 10:20:39 -0400
X-MC-Unique: 2iIh0RSKMXuqUE33YXMKUg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1434310BBEDC;
	Fri, 25 Sep 2020 14:20:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E23875578B;
	Fri, 25 Sep 2020 14:20:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7864244A47;
	Fri, 25 Sep 2020 14:20:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08PEKQ5t014703 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 10:20:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4FD512028E91; Fri, 25 Sep 2020 14:20:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A59E2026F94
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 14:20:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC33380351E
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 14:20:23 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-343-onswEbqtPe6f_R947vlG-A-1; Fri, 25 Sep 2020 10:20:21 -0400
X-MC-Unique: onswEbqtPe6f_R947vlG-A-1
Received: by mail-pf1-f193.google.com with SMTP id d6so3321421pfn.9
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 07:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=E/Cgz17cLyD0MSQK14hl7iUyBkqVrB5po7hyqcxRBDo=;
	b=dD2t0L+6nVIRd3QZywizP5H3TUZTEzEpUZG5QZTX+MQrNVry3dO7S/zVT+H9zGbR/A
	bHcCTB+GMlqnpti7ROEepGebh+H8WOYbalD0d1h4IeZUtZ26QbYjkBT5oCkVcMJkokb3
	JVGkowPjDk4+5u9UzxpkpMof7G+kNJnMTMX7bjcij6eu3MdvkVcRpFV0DDrOWixlVfcy
	xDTN9pMfY7RN7mSxlEENJSTUYmXn74mw15cqG6HvksIrvHf3sGfu3587vEoqKS+0TJUP
	iFgAeNNufKxhWde0BCDIla2qCqJjDWrdykLCjh59MC64dfIm5BLkbdYEj1BXH2nJs5Jv
	MjZQ==
X-Gm-Message-State: AOAM532I7AGw3CDsF176ul/ZLS+rzucjYzE13W0zEFovb9etSf97r5S4
	xlz8sn/gKkNSCArkz8FROCMjx8tJBeEY9w==
X-Google-Smtp-Source: ABdhPJzjLyrDphzZGw97pOcptA6NpA+iljbIgqNxU7CuI0SsW4LbOTMxXHN1kVGXgDjpbNBZ6QOn0Q==
X-Received: by 2002:a62:d456:0:b029:13c:1611:66c2 with SMTP id
	u22-20020a62d4560000b029013c161166c2mr4213234pfl.13.1601043620286;
	Fri, 25 Sep 2020 07:20:20 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
	by smtp.gmail.com with ESMTPSA id t6sm2430962pgj.86.2020.09.25.07.20.19
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 25 Sep 2020 07:20:19 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>
References: <20200923200652.11082-1-snitzer@redhat.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <1a406078-7652-f8eb-e29c-bc4851b23dde@kernel.dk>
Date: Fri, 25 Sep 2020 08:20:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200923200652.11082-1-snitzer@redhat.com>
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
Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-block@vger.kernel.org, dm-devel@redhat.com, hch@lst.de
Subject: Re: [dm-devel] [PATCH 0/2] block/dm: add REQ_NOWAIT support for
	bio-based
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
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9/23/20 2:06 PM, Mike Snitzer wrote:
> Hi,
> 
> I got guilted into this by this Twitter exchange:
> https://twitter.com/axboe/status/1308778488011337728
> 
> Started with this patchset from June and revised it:
> https://patchwork.kernel.org/project/dm-devel/list/?series=297693
> (dropped MD patch while doing so_.
> 
> Tested these changes with this test Jens provided:
> 
> [mikes-test-job]
> filename=/dev/dm-0
> rw=randread
> buffered=1
> ioengine=io_uring
> iodepth=16
> norandommap
> 
> Jens, please feel free to pickup both patches, I don't have any
> conflicting DM changes for 5.10.

Thanks Mike! Applied.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

