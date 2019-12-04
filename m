Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 39BC511303A
	for <lists+dm-devel@lfdr.de>; Wed,  4 Dec 2019 17:48:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575478082;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jMhWMZq+Or/ovzJ909TN6YGJWQR8mmc2cM/pkt1xHsY=;
	b=cJ3W89jUEEdSCwEGDjG18/wF38ZyXQ8oouhQD1pnKiiDueFKM2BSNddVZbkqjtU0qIZ7EW
	Q5Gie2PhUm9LGIlewNWK1Wq0Dpc0XLJIYSR90DxOmsle6tngZgzIK/dpvAqotXaOrY8g/G
	j0jqnO8dZme3XINIyF/+t4BhZCyaChg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-WVjP0xG7M9uJMnjuSjSEhw-1; Wed, 04 Dec 2019 11:48:00 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7E7D801E77;
	Wed,  4 Dec 2019 16:47:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7811A5D6BB;
	Wed,  4 Dec 2019 16:47:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16F325BC11;
	Wed,  4 Dec 2019 16:47:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB4GlgCE016855 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Dec 2019 11:47:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 403EA2026D67; Wed,  4 Dec 2019 16:47:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3870320316E0
	for <dm-devel@redhat.com>; Wed,  4 Dec 2019 16:47:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 906AE10131C2
	for <dm-devel@redhat.com>; Wed,  4 Dec 2019 16:47:39 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-63-r7BFHyezMSSYj_c4MydDxg-1; Wed, 04 Dec 2019 11:47:37 -0500
Received: by mail-lj1-f193.google.com with SMTP id u17so75999lja.4
	for <dm-devel@redhat.com>; Wed, 04 Dec 2019 08:47:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YyMM0D0shdzBn3zas2+m9mHmpEmLrcfrJ76wD+YyLvg=;
	b=ZUHtbm1H/60azmog/Tn9FzXDH7nUEUYoenKVuk24E8/K7kxbqtbQeBPMdqqC/Pxot0
	jQyTckH8lw8LnXl3S7orDgHVvAGI8guYNWwMp6XvuBMp31J0EQNnSjZELCMU03uTNRp1
	K+x0Z+nYaAEX/7XKtVYDoX15z/IrKGAx0cY0Z/T/HCrkilvvaQrXKz7+RnNbv80621fK
	2k0GWD51rwvMxwBbkSKsbCZ6oe8mbU+Ox41TQdtH689th5MdCxYhGgz7YB2wY3/4eEl3
	qg2fGV3yQs9pTj5xRE2IK89yLLfPZi+AFnWoMAwW+uta2OIGJkvY3HSHJbVDSb9yfbLx
	aDLA==
X-Gm-Message-State: APjAAAVbwO18dRFkBl8Zhqscp36Jr3fM/y/GdOCpJB9vJYas+paXDpVg
	XOOOyMvui7IgB5eancxoekcHDg==
X-Google-Smtp-Source: APXvYqzCjy8mxU+0z13pm+WM/iRI7KQE57yiTXMNvhAvXKBtoUhrHBN+XBlNT+PfG61vVd3b+8WlDw==
X-Received: by 2002:a05:651c:2046:: with SMTP id
	t6mr2298763ljo.180.1575478056285; 
	Wed, 04 Dec 2019 08:47:36 -0800 (PST)
Received: from [10.94.250.133] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	d25sm1863168ljj.51.2019.12.04.08.47.35
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 04 Dec 2019 08:47:35 -0800 (PST)
To: Mike Snitzer <snitzer@redhat.com>
References: <20191204140742.26273-1-ntsironis@arrikto.com>
	<20191204140742.26273-3-ntsironis@arrikto.com>
	<20191204152759.qhh2f6ybhww7ivel@reti>
	<4627d4b3-fced-0d22-34c5-258733c9afa9@arrikto.com>
	<20191204163939.GA30305@redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <79971756-2f21-09e1-bfec-7fbc16eba44e@arrikto.com>
Date: Wed, 4 Dec 2019 18:47:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191204163939.GA30305@redhat.com>
Content-Language: en-US
X-MC-Unique: r7BFHyezMSSYj_c4MydDxg-1
X-MC-Unique: WVjP0xG7M9uJMnjuSjSEhw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, thornber@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH 2/2] dm thin: Flush data device before
	committing metadata
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 12/4/19 6:39 PM, Mike Snitzer wrote:>
On Wed, Dec 04 2019 at 11:17am -0500,
> Nikos Tsironis <ntsironis@arrikto.com> wrote:
> 
>> On 12/4/19 5:27 PM, Joe Thornber wrote:
>>> On Wed, Dec 04, 2019 at 04:07:42PM +0200, Nikos Tsironis wrote:
>>>> The thin provisioning target maintains per thin device mappings that map
>>>> virtual blocks to data blocks in the data device.
>>>
>>>
>>> Ack.  But I think we're issuing the FLUSH twice with your patch.  Since the
>>> original bio is still remapped and issued at the end of process_deferred_bios?
>>>
>>
>> Yes, that's correct. I thought of it and of putting a check in
>> process_deferred_bios() to complete FLUSH bios immediately, but I have
>> one concern and I preferred to be safe than sorry.
>>
>> In __commit_transaction() there is the following check:
>>
>>    if (unlikely(!pmd->in_service))
>>              return 0;
>>
>> , which means we don't commit the metadata, and thus we don't flush the
>> data device, in case the pool is not in service.
>>
>> Opening a thin device doesn't seem to put the pool in service, since
>> dm_pool_open_thin_device() uses pmd_write_lock_in_core().
>>
>> Can I assume that the pool is in service if I/O can be mapped to a thin
>> device? If so, it's safe to put such a check in process_deferred_bios().
> 
> In service means upper layer has issued a write to a thin device of a
> pool.  The header for commit 873f258becca87 gets into more detail.
> 
>> On second thought though, in order for a flush bio to end up in
>> deferred_flush_bios in the first place, someone must have changed the
>> metadata and thus put the pool in service. Otherwise, it would have been
>> submitted directly to the data device. So, it's probably safe to check
>> for flush bios after commit() in process_deferred_bios() and complete
>> them immediately.
> 
> Yes, I think so, which was Joe's original point.
>   
>> If you confirm too that this is safe, I will send a second version of
>> the patch adding the check.
> 
> Not seeing why we need another in_service check.  After your changes are
> applied, any commit will trigger a preceeding flush.. so the deferred
> flushes are redundant.
> 

Yes, I meant add a check in process_deferred_bios(), after commit(), to
check for REQ_PREFLUSH bios and complete them immediately. I should have
clarified that.

> By definition, these deferred bios imply the pool is in service.
> 
> I'd be fine with seeing a 3rd follow-on thinp patch that completes the
> redundant flushes immediately.
> 

Ack, I will send another patch fixing this.

Nikos

> Thanks,
> Mike
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

