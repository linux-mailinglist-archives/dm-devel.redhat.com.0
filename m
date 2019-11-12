Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7FBFC102745
	for <lists+dm-devel@lfdr.de>; Tue, 19 Nov 2019 15:48:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574174903;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:resent-to:
	 resent-from:resent-message-id:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=jFyDlP+/9iT1J+czXYu2d3+9e/W51ILCQKSR9LXIV0E=;
	b=NRFOuNZmAoFHyFSYXqVFXMp+hQiwp5IG1DWArB1/YEKql3YF1e/bJmzMVKdEyuH+mZjAYp
	bYDrX52FUiaPTCBW6o2P7ehkIrT9rHKbkBw4S0N3WNRFKrRSv3czE+SOaWNW7us14+GKLV
	BqQ2bfKElcT0S4FjWARQ0PbIm9C5fHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-D40A-3aWP4KBz6efqGH5xA-1; Tue, 19 Nov 2019 09:48:20 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C331C1006212;
	Tue, 19 Nov 2019 14:48:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A196610C9;
	Tue, 19 Nov 2019 14:48:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6E96B4BB65;
	Tue, 19 Nov 2019 14:48:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJEm8K3027903 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 09:48:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6CD9210D14D0; Tue, 19 Nov 2019 14:48:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66FF610D14E2
	for <dm-devel@redhat.com>; Tue, 19 Nov 2019 14:48:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FEA2900A9B
	for <dm-devel@redhat.com>; Tue, 19 Nov 2019 14:48:06 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-257-4dldmizDNWmCc5dJ2eG8Mw-1; Tue, 19 Nov 2019 09:48:04 -0500
Received: by mail-lj1-f194.google.com with SMTP id n21so23589220ljg.12
	for <dm-devel@redhat.com>; Tue, 19 Nov 2019 06:48:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-to:resent-date
	:resent-message-id:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=OKVAcfxje194zRFNg/njiwM3RXKHmEbB7kwF9f13aU4=;
	b=NaUIDv3Cw3spXOqBGQZ7FppeMjxtK0P2dwcoD0D68N8TlKzVeMjLjy90TlIqXp6m7I
	ROdUQrY4FRq40lCGzHNFUG1LFhgBqdnbWXSu37C4BjPwfh8aejC28POrNgz0gDIyDgRZ
	p4vUdlhzQ0ECpesYtpNzJ2mhq/4fYFh6RgbYyGoR0iGAc2ntL56941mqak42OH6TaDJs
	7XxVXny3LL/0jhm1k1A+09Aiz3AB73NVmtnjlwdNBs+7Og1BmAuDilLOAcQDnWqCL9Ky
	rb8AM7Wu2/YiMfQXUf0BwoaoyRUrRBcEDjqreqf8nUgGSNz0OZR8+MAP4a3hnBFIbQw0
	Uupg==
X-Gm-Message-State: APjAAAWBBUYSmbDb7cvxQMuNg/yf6Wa3MxOremQDbLeJiiNPT4mrbP+I
	Cs8uJGy32U3qq7Xy2pOF6z9RA3sfrNw=
X-Google-Smtp-Source: APXvYqwB+3ny/MvUjOk1zPHR+O+a5uCZoTL7mqV1Cm94BChTeFr0R2ZeXrxcXyy+TfTsoPX6n6HsKQ==
X-Received: by 2002:a2e:4703:: with SMTP id u3mr3971000lja.126.1574174882952; 
	Tue, 19 Nov 2019 06:48:02 -0800 (PST)
Received: from [10.94.250.118] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	r22sm10324416lji.71.2019.11.19.06.48.02 for <dm-devel@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Nov 2019 06:48:02 -0800 (PST)
Resent-From: Nikos Tsironis <ntsironis@arrikto.com>
Resent-To: dm-devel@redhat.com
Resent-Date: Tue, 19 Nov 2019 16:48:01 +0200
Resent-Message-ID: <a5ea9944-a781-0c1b-773c-f9e7c61d749f@arrikto.com>
To: Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <snitzer@redhat.com>
References: <alpine.LRH.2.02.1911110811060.28408@file01.intranet.prod.int.rdu2.redhat.com>
	<c9a772e9-e305-cf0b-1155-fb19bdb84e55@arrikto.com>
	<20191112011444.GA32220@redhat.com>
	<alpine.LRH.2.02.1911120240020.25757@file01.intranet.prod.int.rdu2.redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <a6f588d3-2403-d50a-70a1-ed644082cc83@arrikto.com>
Date: Tue, 12 Nov 2019 13:45:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1911120240020.25757@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
X-MC-Unique: 4dldmizDNWmCc5dJ2eG8Mw-1
X-MC-Unique: D40A-3aWP4KBz6efqGH5xA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	dm-devel@redhat.com, Scott Wood <swood@redhat.com>,
	Ilias Tsitsimpis <iliastsi@arrikto.com>
Subject: Re: [dm-devel] [PATCH 1/2] dm-snapshot: fix crash with the realtime
	kernel
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/12/19 9:50 AM, Mikulas Patocka wrote:
> 
> 
> On Mon, 11 Nov 2019, Mike Snitzer wrote:
> 
>> On Mon, Nov 11 2019 at 11:37am -0500,
>> Nikos Tsironis <ntsironis@arrikto.com> wrote:
>>
>>> On 11/11/19 3:59 PM, Mikulas Patocka wrote:
>>>> Snapshot doesn't work with realtime kernels since the commit f79ae415b64c.
>>>> hlist_bl is implemented as a raw spinlock and the code takes two non-raw
>>>> spinlocks while holding hlist_bl (non-raw spinlocks are blocking mutexes
>>>> in the realtime kernel, so they couldn't be taken inside a raw spinlock).
>>>>
>>>> This patch fixes the problem by using non-raw spinlock
>>>> exception_table_lock instead of the hlist_bl lock.
>>>>
>>>> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
>>>> Fixes: f79ae415b64c ("dm snapshot: Make exception tables scalable")
>>>>
>>>
>>> Hi Mikulas,
>>>
>>> I wasn't aware that hlist_bl is implemented as a raw spinlock in the
>>> real time kernel. I would expect it to be a standard non-raw spinlock,
>>> so everything works as expected. But, after digging further in the real
>>> time tree, I found commit ad7675b15fd87f1 ("list_bl: Make list head
>>> locking RT safe") which suggests that such a conversion would break
>>> other parts of the kernel.
>>
>> Right, the proper fix is to update list_bl to work on realtime (which I
>> assume the referenced commit does).  I do not want to take this
>> dm-snapshot specific workaround that open-codes what should be done
>> within hlist_{bl_lock,unlock}, etc.
> 
> If we change list_bl to use non-raw spinlock, it fails in dentry lookup 
> code. The dentry code takes a seqlock (which is implemented as preempt 
> disable in the realtime kernel) and then takes a list_bl lock.
> 
> This is wrong from the real-time perspective (the chain in the hash could 
> be arbitrarily long, so using non-raw spinlock could cause unbounded 
> wait), however we can't do anything with it.
> 
> I think that fixing dm-snapshot is way easier than fixing the dentry code. 
> If you have an idea how to fix the dentry code, tell us.
> 

I too think that it would be better to fix list_bl. dm-snapshot isn't
really broken. One should be able to acquire a spinlock while holding
another spinlock.

Moreover, apart from dm-snapshot, anyone ever using list_bl is at risk
of breaking the realtime kernel, if he or she is not aware of that
particular limitation of list_bl's implementation in the realtime tree.

But, I agree that it's a lot easier "fixing" dm-snapshot than fixing the
dentry code.

>> I'm not yet sure which realtime mailing list and/or maintainers should
>> be cc'd to further the inclussion of commit ad7675b15fd87f1 -- Nikos do
>> you?

No, unfortunately, I don't know for sure either. [1] and [2] suggest
that the relevant mailing lists are LKML and linux-rt-users and the
maintainers are Sebastian Siewior, Thomas Gleixner and Steven Rostedt.

I believe they are already Cc'd in the other thread regarding Mikulas'
"realtime: avoid BUG when the list is not locked" patch (for some reason
the thread doesn't properly appear in dm-devel archives and also my
mails to dm-devel have being failing since yesterday - Could there be an
issue with the mailing list?), so maybe we should Cc them in this thread
too.

Nikos

[1] https://wiki.linuxfoundation.org/realtime/communication/mailinglists
[2] https://wiki.linuxfoundation.org/realtime/communication/send_rt_patches

>>
>> Thanks,
>> Mike
> 
> Mikulas
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

