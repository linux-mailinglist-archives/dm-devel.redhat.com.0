Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECAD13D33E
	for <lists+dm-devel@lfdr.de>; Thu, 16 Jan 2020 05:44:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579149863;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MgXLyazm5nTW6sGvaG71dX+G3szYOHZZdOIOKfyF2/Y=;
	b=bXgtfzoWJQv7SZeHnDZv01xqYBVrKxe3lAVKzn+NZlnDOF3BPe5Ip6K77S35sdWk7wD4oC
	UFUsAqBqhApPsqijfyR41fPR7RV+m6Ob7geO+RqARfBim9V7r3UndnN/a/xgSwlIcMHtmC
	IiT7KDXH+sr9mbSV7K4U2Cvk3yYzXHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-sP8MvL6xPwKgTHrz-JfP2g-1; Wed, 15 Jan 2020 23:44:21 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C9F7800A02;
	Thu, 16 Jan 2020 04:44:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACDF27FB76;
	Thu, 16 Jan 2020 04:44:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 42B5781C99;
	Thu, 16 Jan 2020 04:44:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00G4hojr022268 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 23:43:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E0CD82166B28; Thu, 16 Jan 2020 04:43:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB1AC2166B27
	for <dm-devel@redhat.com>; Thu, 16 Jan 2020 04:43:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E44B1803898
	for <dm-devel@redhat.com>; Thu, 16 Jan 2020 04:43:47 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-1-e0w_auvXP72UVd6pFV1NSw-1; Wed, 15 Jan 2020 23:43:43 -0500
Received: by mail-pj1-f67.google.com with SMTP id s7so968974pjc.0
	for <dm-devel@redhat.com>; Wed, 15 Jan 2020 20:43:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tQOS9ykL8kDiDpFhWlW2cOv2Kzb1Z6JcIaDHRAWaufU=;
	b=Tuu6QdBpyXptPwE/xjOpfC6Yq9WM9bzUqO01fspvHjLpNXPReKLbS7FHVbrvfueINX
	JqPRk/jnLtrZ1UBU0vjfUIwixIdLqvYl4mJ5ic/MGnXIcMPGntt8wWPlCQHAN6lwqTAv
	zG+PPnYFDrnU5UbI4MC5pGtKWD9wB4rc2kx3bNduwYLomlIr324E6FoYeTs4QzUiKSJ1
	+cgW6MTP3Efyh2odgF9iv3SL7/cXb3g5OSmwVr0B3u3+s2xEeLoV83Dlh5YGLln3QmrM
	O9l63uhQbm72F3wTQFMW9pOmYpT19dz5+QsCtvyJO7Vezn3nUeO/r3wL0rL7jT/oDP7V
	3i0w==
X-Gm-Message-State: APjAAAX1gt8lOHZB9sFcJKDX5kEJ3F3Zu/gahU16qAS8Vtp+oh5fJwNW
	MijDUXK2emWe/emyUjR/0hpEVw==
X-Google-Smtp-Source: APXvYqzOne459gI8+ok09JE1JN36m1QzqwT/j4wr0q9YgDvHpfW1mqNP0LmmW1pvFG8+z+uaV60IZg==
X-Received: by 2002:a17:902:8f8e:: with SMTP id
	z14mr22136266plo.195.1579149822350; 
	Wed, 15 Jan 2020 20:43:42 -0800 (PST)
Received: from [192.168.1.188] ([66.219.217.145])
	by smtp.gmail.com with ESMTPSA id
	z30sm22451520pff.131.2020.01.15.20.43.41
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 15 Jan 2020 20:43:41 -0800 (PST)
To: Mikulas Patocka <mpatocka@redhat.com>
References: <alpine.LRH.2.02.2001150833180.31494@file01.intranet.prod.int.rdu2.redhat.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <c013af2b-d5b9-06d9-e617-db882cde4a37@kernel.dk>
Date: Wed, 15 Jan 2020 21:43:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2001150833180.31494@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
X-MC-Unique: e0w_auvXP72UVd6pFV1NSw-1
X-MC-Unique: sP8MvL6xPwKgTHrz-JfP2g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mike Snitzer <msnitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH] block: fix an integer overflow in logical
	block size
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1/15/20 6:35 AM, Mikulas Patocka wrote:
> Logical block size has type unsigned short. That means that it can be at
> most 32768. However, there are architectures that can run with 64k pages
> (for example arm64) and on these architectures, it may be possible to
> create block devices with 64k block size.
> 
> For exmaple (run this on an architecture with 64k pages):
> # modprobe brd rd_size=1048576
> # dmsetup create cache --table "0 `blockdev --getsize /dev/ram0` writecache s /dev/ram0 /dev/ram1 65536 0"
> # mkfs.ext4 -b 65536 /dev/mapper/cache
> # mount -t ext4 /dev/mapper/cache /mnt/test
> 
> Mount will fail with this error because it tries to read the superblock using 2-sector
> access:
>   device-mapper: writecache: I/O is not aligned, sector 2, size 1024, block size 65536
>   EXT4-fs (dm-0): unable to read superblock
> 
> This patch changes the logical block size from unsigned short to unsigned
> int to avoid the overflow.

Thanks, applied.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

