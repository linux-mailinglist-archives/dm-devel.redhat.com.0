Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 757C3ECD01
	for <lists+dm-devel@lfdr.de>; Sat,  2 Nov 2019 04:02:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572663747;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fU9qpg2dW+Yf6CeYwML71PQ13vjHLL9+VZb3e3igLAE=;
	b=gE1PYLE9vL6hCXoGBFHcRpFKVwkb6gOkJ2yJZ57Kxypa+2QtpSxd2E6CplHpknvVxTIg9Q
	a8rBuI8FT1F/t6wkKw3GkDM/RB0WzD0sMuFgkv2PUpnPoihUSnAmGWHYnPOb7joOdRucNb
	gplyOarNNRM7IY/J15tkCiXYXIKwGqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-G40T1zzANZaJarZnPOV9wQ-1; Fri, 01 Nov 2019 23:02:25 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B84B1005500;
	Sat,  2 Nov 2019 03:02:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2159F5D6A5;
	Sat,  2 Nov 2019 03:02:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B51B18095FF;
	Sat,  2 Nov 2019 03:02:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA231ku6029636 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 1 Nov 2019 23:01:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 01A5760BEC; Sat,  2 Nov 2019 03:01:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF26860BE2
	for <dm-devel@redhat.com>; Sat,  2 Nov 2019 03:01:43 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 83B8B85A07
	for <dm-devel@redhat.com>; Sat,  2 Nov 2019 03:01:41 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id g9so5143988plp.3
	for <dm-devel@redhat.com>; Fri, 01 Nov 2019 20:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7NwBt9a6SQW1gZdGthoi1MUCZhj7J0hx7vs90QD7LPE=;
	b=t01Bhw7DQumO9PI/YdLWPfy0a6FlO/TtbboncxeQpMv/X/PCwcWLs95c07ZPbMONUn
	ZHhX+QrusYK0JRd9AOGG3mkGxNP8HhlQ/KMpWIEI48c1AxoIXoHZz48qtOYPoSze+Frd
	5QaXCQwkZ7Zna9SnUyUm8gPhFM2CTBpvT0Wg2xMn/b5siXsxvQ2Z4ZmQ80jkiaK1O6Sw
	Kwsx6gDfGuSdsC+eaePLFQOoTFHGgMpXF2uqLrxcFwouEj1+ThFSjImnNvns/R7GFCmn
	rg1a6pQUO2bx9VX/CIG7g46DyBMtNOcvIHJKFuEcxfLb1wDvV6VrmwTSGiS5m0yTV04R
	t+qQ==
X-Gm-Message-State: APjAAAU4VgI6uWko5FMDtsa+0DeK1V/ZMs5wBNH3UHo601nag/PdCA97
	+e4Wc63iU/Wp3nw/G/wBQladBA==
X-Google-Smtp-Source: APXvYqz3du8Nu9k+fUXmP6mr2iwTN2aAu0IEqPhw0GrrVGm8ADdK4T5H+F5WeWr42XXK+Dzp6tSURg==
X-Received: by 2002:a17:902:8d8a:: with SMTP id
	v10mr16010030plo.32.1572663700720; 
	Fri, 01 Nov 2019 20:01:40 -0700 (PDT)
Received: from [192.168.1.188] ([66.219.217.79])
	by smtp.gmail.com with ESMTPSA id q6sm8368926pgn.44.2019.11.01.20.01.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2019 20:01:39 -0700 (PDT)
To: Damien Le Moal <damien.lemoal@wdc.com>, linux-block@vger.kernel.org,
	linux-scsi@vger.kernel.org, "Martin K . Petersen"
	<martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
References: <20191027140549.26272-1-damien.lemoal@wdc.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <926948c1-d9a0-4156-4639-bbac1d0ba10b@kernel.dk>
Date: Fri, 1 Nov 2019 21:01:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191027140549.26272-1-damien.lemoal@wdc.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Sat, 02 Nov 2019 03:01:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Sat, 02 Nov 2019 03:01:41 +0000 (UTC) for IP:'209.85.214.195'
	DOMAIN:'mail-pl1-f195.google.com'
	HELO:'mail-pl1-f195.google.com' FROM:'axboe@kernel.dk' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.214.195 mail-pl1-f195.google.com 209.85.214.195
	mail-pl1-f195.google.com <axboe@kernel.dk>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>, Keith Busch <kbusch@kernel.org>,
	Hans Holmberg <Hans.Holmberg@wdc.com>, Ajay Joshi <ajay.joshi@wdc.com>,
	Matias Bjorling <matias.bjorling@wdc.com>
Subject: Re: [dm-devel] [PATCH 0/8] Zone management commands support
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
X-MC-Unique: G40T1zzANZaJarZnPOV9wQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/27/19 8:05 AM, Damien Le Moal wrote:
> This series implements a few improvements and cleanups to zone block
> device zone reset operations with the first three patches.
> 
> The remaining of the series patches introduce zone open, close and
> finish support, allowing users of zoned block devices to explicitly
> control the condition (state) of zones.
> 
> While these operations are not stricktly necessary for the correct
> operation of zoned block devices, the open and close operations can
> improve performance for some device implementations of the ZBC and ZAC
> standards under write workloads. The finish zone operation, which
> transition a zone to the full state, can also be useful to protect a
> zone data by preventing further zone writes.
> 
> These operations are implemented by introducing the new
> REQ_OP_ZONE_OPEN, REQ_OP_ZONE_CLOSE and REQ_OP_ZONE_FINISH request codes
> and the function blkdev_zone_mgmt() to issue these requests. This new
> function also replaces the former blkdev_reset_zones() function to reset
> zones write pointer.
> 
> The new ioctls BLKOPENZONE, BLKCLOSEZONE and BLKFINISHZONE are also
> defined to allow applications to issue these new requests without
> resorting to a device passthrough interface (e.g. SG_IO).
> 
> Support for these operations is added to the SCSI sd driver, to the dm
> infrastructure (dm-linear and dm-flakey targets) and to the null_blk
> driver.

Can patch 3 go in separately, doesn't look like we need it in this
series?

Also need the DM folks to review/sign off on patch 7. Mike?

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

