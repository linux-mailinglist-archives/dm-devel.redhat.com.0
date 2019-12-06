Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6964511525A
	for <lists+dm-devel@lfdr.de>; Fri,  6 Dec 2019 15:16:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575641761;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6pl3OafyWEC2raL0zos0G2HjTSSKGVqH8lwIQWef48o=;
	b=Xqs/wxsXM+g5SEEqgELGt7ZE0/2x9jEkEV56M1aoA0XIoE0k3fneS/RwkzvlkUmyQ3KN6G
	U6vaMVMGFD9qfuFWtuaWkpI1VrMB2wW1LrRQPFADSF+V6OVcVtFkc8aTTAm1G/mcTOqkRV
	sEHhvWFmNMUwmo+wxcRjGp/nQi1KlWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-_eiNgcBgNECgMf9DuyIagw-1; Fri, 06 Dec 2019 09:15:57 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A37463CC0;
	Fri,  6 Dec 2019 14:15:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8AA060138;
	Fri,  6 Dec 2019 14:15:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA72965D21;
	Fri,  6 Dec 2019 14:15:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB6EFJO4014386 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 6 Dec 2019 09:15:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5B3922166B2E; Fri,  6 Dec 2019 14:15:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 569F32166B30
	for <dm-devel@redhat.com>; Fri,  6 Dec 2019 14:15:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AA788C4409
	for <dm-devel@redhat.com>; Fri,  6 Dec 2019 14:15:17 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-305-I5cbsrGuNA2wyPQC11fTGA-1; Fri, 06 Dec 2019 09:15:15 -0500
Received: by mail-lj1-f176.google.com with SMTP id k8so7819165ljh.5
	for <dm-devel@redhat.com>; Fri, 06 Dec 2019 06:15:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:cc:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wdGGvPmbKyl1Mo/x+Ao8de4aMgM9SLc+rvOhBwfvllw=;
	b=N4aZRwlzwF1aAZqTTc2LrZUyFLZZFK9kWegPt2hHfbx2t91RGNvP/5aOpwjSHCtgF4
	UuMX9MUq6+6U6aGG8BKKVixiIs+60062LEIJQwCkg/oJjZliofmCKuT08XJz2v9OXJba
	d08AspOFosD5UBUKnLT/BedXgh/HdOqhNDoDE3/1qDW6k0lBpBaFq8IPr6nzNA04G/TH
	EM5RTJshZ6j0UTJHfdfsB7hmNAu29IkZSyZ4AW/cEA6e0sN1eUEFmTjh7VhLqgRH+SKM
	tsxvjez0qVsBTkXewUMXXst2IYogBlOLEjAIbu0HG91XMnZ1P/Wy1GQdBqJK/w5NaBmm
	YzbQ==
X-Gm-Message-State: APjAAAV3jLFl9GyF7OFcGiBCL+YSCskfdU8dCfqxWCMIuPYfH3OjqsU+
	UIQDSgDdAFrPDwjAk0PBMCoYJTNbqeg=
X-Google-Smtp-Source: APXvYqy7xc7Ma5dYipbsgBTOv5vccqQqggfOccW22QoQLuEogfguuUv0Y6CIUKNwC9SFI1DJEDsSXA==
X-Received: by 2002:a05:651c:285:: with SMTP id
	b5mr8935465ljo.14.1575641712554; 
	Fri, 06 Dec 2019 06:15:12 -0800 (PST)
Received: from [10.94.250.133] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id e8sm7810516ljb.45.2019.12.06.06.15.11
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 06 Dec 2019 06:15:12 -0800 (PST)
To: thornber@redhat.com
References: <35cf1ecf-5cd8-604b-ec4e-18c9fd4a4195@linux.alibaba.com>
	<20191122185530.pcrgmb655dkdbdcq@reti>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <629bd851-8d89-00bd-0fea-d140961e8752@arrikto.com>
Date: Fri, 6 Dec 2019 16:15:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191122185530.pcrgmb655dkdbdcq@reti>
Content-Language: en-US
X-MC-Unique: I5cbsrGuNA2wyPQC11fTGA-1
X-MC-Unique: _eiNgcBgNECgMf9DuyIagw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: JeffleXu <jefflexu@linux.alibaba.com>, dm-devel@redhat.com
Subject: Re: [dm-devel] dm-thin: Several Questions on dm-thin performance.
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
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 11/22/19 8:55 PM, Joe Thornber wrote:
> On Fri, Nov 22, 2019 at 11:14:15AM +0800, JeffleXu wrote:
> 
>> The first question is what's the purpose of data cell? In thin_bio_map(),
>> normal bio will be packed as a virtual cell and data cell. I can understand
>> that virtual cell is used to prevent discard bio and non-discard bio
>> targeting the same block from being processed at the same time. I find it
>> was added in commit     e8088073c9610af017fd47fddd104a2c3afb32e8 (dm thin:
>> fix race between simultaneous io and discards to same block), but I'm still
>> confused about the use of data cell.
> 
> As you are aware there are two address spaces for the locks.  The 'virtual' one
> refers to cells in the logical address space of the thin devices, and the 'data' one
> refers to the underlying data device.  There are certain conditions where we
> unfortunately need to hold both of these (eg, to prevent a data block being reprovisioned
> before an io to it has completed).
> 
>> The second question is the impact of virtual cell and data cell on IO
>> performance. If $data_block_size is large for example 1G, in multithread fio
>> test, most bio will be buffered in cell->bios list and then be processed by
>> worker thread asynchronously, even when there's no discard bio. Thus the
>> original parallel IO is processed by worker thread serially now. As the
>> number of fio test threads increase, the single worker thread can easily get
>> CPU 100%, and thus become the bottleneck of the performance since dm-thin
>> workqueue is ordered unbound.
> 
> Yep, this is a big issue.  Take a look at dm-bio-prison-v2.h, this is the
> new interface that we need to move dm-thin across to use (dm-cache already uses it).
> It allows concurrent holders of a cell (ie, read locks), so we'll be able to remap
> much more io without handing it off to a worker thread.  Once this is done I want
> to add an extra field to cells that will cache the mapping, this way if you acquire a
> cell that is already held then you can avoid the expensive btree lookup.  Together
> these changes should make a huge difference to the performance.
> 
> If you've got some spare coding cycles I'd love some help with this ;)
> 

Hi Joe,

I would be interested in helping you with this task. I can't make any
promises, but I believe I could probably spare some time to work on it.

If you think you could use the extra help, let me know.

Nikos

> - Joe
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

