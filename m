Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 43AA920FBAA
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 20:23:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-sD8QayZoPRmIW22UXuEOHg-1; Tue, 30 Jun 2020 14:23:43 -0400
X-MC-Unique: sD8QayZoPRmIW22UXuEOHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 708D71005513;
	Tue, 30 Jun 2020 18:23:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA0705C1B0;
	Tue, 30 Jun 2020 18:23:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F31B16C9C5;
	Tue, 30 Jun 2020 18:23:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05UIM5ES028192 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 14:22:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B42610A4F60; Tue, 30 Jun 2020 18:22:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16BD810A4F65
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 18:22:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C1A98007CD
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 18:22:00 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-471-s1BBGYg7NOyGVKyLTCKTWg-1; Tue, 30 Jun 2020 14:21:57 -0400
X-MC-Unique: s1BBGYg7NOyGVKyLTCKTWg-1
Received: by mail-pj1-f67.google.com with SMTP id i4so9838573pjd.0
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 11:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9nMjhxRG610D6xAYb4aZ5VRp2i+EwPdQw1qks+ZgrLU=;
	b=cd6P72hlFiqvcKksGq8FZpI1yK7ype8QnUqbMW18CRuNCfkTZ38AsE5Z27LHjCq1qM
	E+BLpSJ3mR89CXAjh5MD7+WAaTfT41IdngYY8OesLvu2smVrTlKy1kH0FRJc9ka9PIKn
	rJlJeRIke9m3peBaaiyXaApE7o7T0ZvhOzijulEARNIdBRNzoct8WEK6yZNTXWhOg+7h
	gfo5KcUc8V8ZBKGC19qJF5lqD3VgWbv4DKTtthxZorQWKXVBee6R1sYIYAaDM1/ktSnK
	CLj1emYSmAWsmeiczQ9YQ8ndPI2g4OUsyaJby/7xnifhLhxT1yHjaGmduf/lneutQnyC
	2lFw==
X-Gm-Message-State: AOAM5333gkVNdlT8+2WGDuNiqgdgsOSruAu8l35crdc7P1bSyGfYr+tB
	HAFaIGEmeXTruoPkEmt1MIWL1vStI4CWNQ==
X-Google-Smtp-Source: ABdhPJx1eVZzUauHavuDMn/utz58o2Sp76o2c6uyFezmO+u8oFk4qpnRUZKKvG8yetkSCycNIsxDcg==
X-Received: by 2002:a17:90a:7409:: with SMTP id
	a9mr23663497pjg.107.1593541316394; 
	Tue, 30 Jun 2020 11:21:56 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:4113:50ea:3eb3:a39b?
	([2605:e000:100e:8c61:4113:50ea:3eb3:a39b])
	by smtp.gmail.com with ESMTPSA id
	10sm3244047pfx.136.2020.06.30.11.21.54
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 30 Jun 2020 11:21:55 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20200629193947.2705954-1-hch@lst.de>
	<bd1443c0-be37-115b-1110-df6f0e661a50@kernel.dk>
	<6ddbe343-0fc2-58c8-3726-c4ba9952994f@kernel.dk>
	<20200630181928.GA7853@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <f173ab34-53c4-0316-f755-240f00cc7075@kernel.dk>
Date: Tue, 30 Jun 2020 12:21:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200630181928.GA7853@lst.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-xtensa@linux-xtensa.org, linux-m68k@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-nvdimm@lists.01.org,
	dm-devel@redhat.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, drbd-dev@tron.linbit.com,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [dm-devel] rename ->make_request_fn and move it to the
 block_device_operations
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/30/20 12:19 PM, Christoph Hellwig wrote:
> On Tue, Jun 30, 2020 at 09:43:31AM -0600, Jens Axboe wrote:
>> On 6/30/20 7:57 AM, Jens Axboe wrote:
>>> On 6/29/20 1:39 PM, Christoph Hellwig wrote:
>>>> Hi Jens,
>>>>
>>>> this series moves the make_request_fn method into block_device_operations
>>>> with the much more descriptive ->submit_bio name.  It then also gives
>>>> generic_make_request a more descriptive name, and further optimize the
>>>> path to issue to blk-mq, removing the need for the direct_make_request
>>>> bypass.
>>>
>>> Looks good to me, and it's a nice cleanup as well. Applied.
>>
>> Dropped, insta-crashes with dm:
> 
> Hmm.  Can you send me what is at "submit_bio_noacct+0x1f6" from gdb?
> Or your .config?

I'd have to apply and compile again. But it's a bad RIP, so I'm guessing
it's ->submit_bio == NULL. Let me know if you really need it, and I can
re-generate the OOPS and have the vmlinux too.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

