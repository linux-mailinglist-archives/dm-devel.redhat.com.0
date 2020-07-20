Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 169C8226C86
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 18:57:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-zMA_H9Y0PQaZHfzaQU57Sw-1; Mon, 20 Jul 2020 12:56:57 -0400
X-MC-Unique: zMA_H9Y0PQaZHfzaQU57Sw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAB218017FB;
	Mon, 20 Jul 2020 16:56:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2348A5C1D4;
	Mon, 20 Jul 2020 16:56:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D6631809554;
	Mon, 20 Jul 2020 16:56:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06KGuUu5014651 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 12:56:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 92F4110E51B2; Mon, 20 Jul 2020 16:56:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D70510E51B1
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 16:56:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C11218056AB
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 16:56:28 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
	[209.85.166.180]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-80-XyFX_h7fNeGzRzxLNmiy3w-1; Mon, 20 Jul 2020 12:56:26 -0400
X-MC-Unique: XyFX_h7fNeGzRzxLNmiy3w-1
Received: by mail-il1-f180.google.com with SMTP id a11so13942059ilk.0
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 09:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VP2nB550LCm9f5amiI4hf7RrVCu1pcK2lzmvzfZ1TsY=;
	b=jWKbXp3FvoXNBv1Lh04rb713ynv0Etwn8YxZ6H6/RXQ8GD3Q4Ex6lsZe/ltfxzuakp
	XieIsW2v+f6A2SMR8SDRL4veaDeSsDah8zD3G1KqJOoc5c6lhQDueriZiipU+XAQWgkb
	QRDfLBnDZrT10LEt56Baz/oXrBKPf4kNt0n7f7Ay1kfe2yRVNTJA9BukFf/u9VymbX6M
	ZKl08+5p55kUYqDqN0D7xR8QuYdbk9DWRjFyo3prco7EvogQH9vvR2CQ/xqBvtHF/5I3
	8Cwy8Fvah4ety9VT9nYA1bjsI0pMUcg9WGnyWspcHOi9MPSUoeJdtmSQax/sc00X0Skx
	7sfQ==
X-Gm-Message-State: AOAM530qTY492j3FqOZUaNNWEk1Lbbwa7NuLvkY6lsyP1oxC7w1ThVZY
	Pc/4wEBaZ+/pmfHTr8RaQeXhaSlkYjoUIg==
X-Google-Smtp-Source: ABdhPJw1cGdsnGdd3eRJFrNgk4zjQ8yfTB5C639kXeWtf+7dgPZWeRXaP19mTHO8+c/Fq3IrY+Wkow==
X-Received: by 2002:a05:6e02:4ca:: with SMTP id
	f10mr24127244ils.291.1595264185179; 
	Mon, 20 Jul 2020 09:56:25 -0700 (PDT)
Received: from [192.168.1.58] ([65.144.74.34])
	by smtp.gmail.com with ESMTPSA id o19sm9141493iob.5.2020.07.20.09.56.24
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 20 Jul 2020 09:56:24 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20200720061251.652457-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <dfe56cf2-db3d-3461-9834-be314f4080ef@kernel.dk>
Date: Mon, 20 Jul 2020 10:56:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720061251.652457-1-hch@lst.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/20/20 12:12 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series ensures that the zoned device limitations are properly
> inherited in blk_stack_limits, and then cleanups up two rather
> pointless wrappers around it.

We should probably make this against for-5.9/drivers instead, to avoid
an unnecessary conflict when merging.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

