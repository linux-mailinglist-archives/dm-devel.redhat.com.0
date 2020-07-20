Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8D23922716E
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 23:43:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-p79Y2EhwPwSWy6vTJxhcjg-1; Mon, 20 Jul 2020 17:43:54 -0400
X-MC-Unique: p79Y2EhwPwSWy6vTJxhcjg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C03571DE5;
	Mon, 20 Jul 2020 21:43:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB8805D9DD;
	Mon, 20 Jul 2020 21:43:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B0821809554;
	Mon, 20 Jul 2020 21:43:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06KLeClI021014 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 17:40:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 687D2100414F; Mon, 20 Jul 2020 21:40:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63C1A1004153
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 21:40:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90655856A54
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 21:40:09 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
	[209.85.166.182]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-250-8rq2AD4DOqOc40_mNotokg-1; Mon, 20 Jul 2020 17:40:04 -0400
X-MC-Unique: 8rq2AD4DOqOc40_mNotokg-1
Received: by mail-il1-f182.google.com with SMTP id h16so14629615ilj.11
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 14:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rKJKS5v+fEVOz68RmsMB7ze/F2+4VEIuZSBHXiKWNHY=;
	b=B6lSsnBESLZAPJ+NbAWqjHXtgaNVhYl4GSXnRyMtUqUp3pJeVlTLXvgt1G+ndJRGjQ
	b6A5cwQongQjLG1LBBn3thCqZuMU9dRO9KkIS7q9mZQiDVCNbpoi5By8N5Egs530Hb4S
	Qp3xInyaBURgpH/BxdmpnDXbT4lagSw6QLm2916DvcchRtQ20+GBnNH5+6VvKxDx5wRY
	SpfFd8j+g/AEUskcNNTEMADI2wdEfwrmfGZrJNH9X7M6GAwQ/qV0aBcyAekJt7GcLUJM
	rN9s1rC5FYEXo0gHiNVBJxXKH7ju2SpQsS6134roaXZMWknwS44/ZuhaCS6/XPsFx8DA
	Bz0A==
X-Gm-Message-State: AOAM530yQmXvfjYguMf7fONlzcrkFiaj6BM9ycAkHdBeTWtYi6hVHA2U
	lCUu8qFZ0i1AUgpou80xrwHHyg33PlgJQw==
X-Google-Smtp-Source: ABdhPJzVzXbuG6fyqFYOSjRTCIYq495m3j59E/eBmMqBtakGIZIx6kkteMs9Brg5KbQkraDI2LYDKA==
X-Received: by 2002:a05:6e02:13e2:: with SMTP id
	w2mr25931439ilj.9.1595281203701; 
	Mon, 20 Jul 2020 14:40:03 -0700 (PDT)
Received: from [192.168.1.58] ([65.144.74.34])
	by smtp.gmail.com with ESMTPSA id i6sm9361776ilj.61.2020.07.20.14.40.02
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 20 Jul 2020 14:40:03 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
References: <20200720061251.652457-1-hch@lst.de>
	<dfe56cf2-db3d-3461-9834-be314f4080ef@kernel.dk>
	<20200720173530.GA21442@lst.de>
	<ab942c19-68c3-2a76-b3b2-136a2bf3ca54@kernel.dk>
Message-ID: <b569fba9-bf1d-b9c8-1bd4-00d0b6111a7e@kernel.dk>
Date: Mon, 20 Jul 2020 15:40:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ab942c19-68c3-2a76-b3b2-136a2bf3ca54@kernel.dk>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/20/20 3:35 PM, Jens Axboe wrote:
> On 7/20/20 11:35 AM, Christoph Hellwig wrote:
>> On Mon, Jul 20, 2020 at 10:56:23AM -0600, Jens Axboe wrote:
>>> On 7/20/20 12:12 AM, Christoph Hellwig wrote:
>>>> Hi Jens,
>>>>
>>>> this series ensures that the zoned device limitations are properly
>>>> inherited in blk_stack_limits, and then cleanups up two rather
>>>> pointless wrappers around it.
>>>
>>> We should probably make this against for-5.9/drivers instead, to avoid
>>> an unnecessary conflict when merging.
>>
>> Then we'd also need a merge as my next series depends on this, and it
>> clearly is core material.  Not sure which one is more important.
> 
> Hmm, might make more sense to kick off a branch topic for this and just
> merge it after the other ones.

Created a for-5.9/block-merge which is based on 5.8-rc6, with the 5.9
block and drivers branches merged in. Applied the series on top.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

