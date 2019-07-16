Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC606A9F7
	for <lists+dm-devel@lfdr.de>; Tue, 16 Jul 2019 16:00:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 184FC882EA;
	Tue, 16 Jul 2019 14:00:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 031AE5D721;
	Tue, 16 Jul 2019 14:00:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B6BF1972D;
	Tue, 16 Jul 2019 13:59:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GDxj2v002544 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 09:59:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 11A645B684; Tue, 16 Jul 2019 13:59:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D0AE5D721
	for <dm-devel@redhat.com>; Tue, 16 Jul 2019 13:59:42 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9DAB4308A963
	for <dm-devel@redhat.com>; Tue, 16 Jul 2019 13:59:41 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id z1so21045553wru.13
	for <dm-devel@redhat.com>; Tue, 16 Jul 2019 06:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=XUrjLTahAa9Kr3nxETCBzViYM0QMZdPVrEFcKmIiSy0=;
	b=U1kY6kKiWzlFR4BOKVBXnaQHnEVuZ1tbnHr+3Rwx/u54Qd0tr+e9kbtDvsM956YZsw
	FmYumooUMp9V+bQl4YOgNLpbAdPORffLLL7cOq8+4CEJeaHcMPR339vikot6Mq/Fw8Jx
	EnakDHk2IkHxf0mlbiSoVJqui26ibW3xk1ZP0TOtfEGQ/LQR2VlFKfAGl81XIBCLkV0W
	hR0Et/nDAS269XaGOiCwdnuixD/hxn0iActutVDbWKNcdSsbIlFjh3BQkrZBu3zBvncT
	upR3eFLSfbr9C0lMEHvIE2l7WeuV7GrtzrIoBleD8jnBX55i3X80dioHyJYhA1B5kbqy
	ORwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=XUrjLTahAa9Kr3nxETCBzViYM0QMZdPVrEFcKmIiSy0=;
	b=BU25173B0Gxpzpw0hrwYHcZ/b1VCUNlHVN/0Gn0tsCnzCvEeFNCS/zL0bppneUQGy0
	ubfdpbh6qTmLins7cyk2IVLGZ50u00Mtovlb4TGx+UzoRW3Ix6Zh5Y0dnUuW/C5YE0Nx
	LBoaebnhh9CTeh/RjVsO7kzn6pVBhRCeycgRgGr1lC/iIDHvSFUzwfvzNxAO4F/+Pits
	TDaCsI7uD1BXkqAxpzX+b8g4WCtu5XvaCl/WwPYl3yB7TfPuvOhBOtvow88K1O0kJcWT
	EsoJTZZ6VHUA8iv7f3L1CE/KN30VlBLz9AkBD862IZNlppINn2TlPbqTBm51pc8NUhwB
	BgNg==
X-Gm-Message-State: APjAAAU0sa2ObfBeAGwkYqB3COe9uOG2mthb7pPoCS7edZFQLIGyDc0v
	yX26ef+c+LyivONysA81szSphbXthOY=
X-Google-Smtp-Source: APXvYqzYxq9IZZuNXWjLzQ7jBusqFgze2y8IJOjlnvin2o1dDOWf0Ym+v8ugYvJmuYC+dOjiuA6qbQ==
X-Received: by 2002:a5d:4111:: with SMTP id l17mr36480989wrp.59.1563285580099; 
	Tue, 16 Jul 2019 06:59:40 -0700 (PDT)
Received: from [10.94.250.119] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	v204sm18786895wma.20.2019.07.16.06.59.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jul 2019 06:59:39 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>
References: <20190603134017.9323-1-ntsironis@arrikto.com>
	<b6cdb071-f8d3-7c09-c938-71689ceb1c95@arrikto.com>
	<20190715182221.GB15315@redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <54f185d8-5cf7-b617-1dfe-418da7643004@arrikto.com>
Date: Tue, 16 Jul 2019 16:59:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190715182221.GB15315@redhat.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 16 Jul 2019 13:59:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Tue, 16 Jul 2019 13:59:42 +0000 (UTC) for IP:'209.85.221.47'
	DOMAIN:'mail-wr1-f47.google.com' HELO:'mail-wr1-f47.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: 0  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.47 mail-wr1-f47.google.com 209.85.221.47
	mail-wr1-f47.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] dm kcopyd: Increase sub-job size to 512KiB
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Tue, 16 Jul 2019 14:00:05 +0000 (UTC)

On 7/15/19 9:22 PM, Mike Snitzer wrote:
> On Fri, Jul 12 2019 at  9:45am -0400,
> Nikos Tsironis <ntsironis@arrikto.com> wrote:
> 
>> Hi Mike,
>>
>> A kind reminder about this patch. Do you require any changes or will you
>> merge it as is?
> 
> I think we need changes to expose knob(s) to tune this value on a global
> _and_ device level via sysfs.  E.g.:
> 
> 1) dm_mod module param for global
> 2) but also allow a per-device override, like:
>    echo 512 > /sys/block/dm-X/dm/kcopyd_subjob_size
> 

Hi Mike,

Thanks for your feedback. I agree, this sounds like the best thing to do.

> 1 is super easy and is a start.  Layering in 2 is a bit more involved.

Maybe I could help with (2). We could discuss about it and how you think
it's best to do it and then I could proceed with an implementation.

Please let me know what you think.

> 
> In hindsight (given how risk-averse I am on changing the default) I
> should've kept the default 128 but allowed override with modparam
> dm_mod.kcopyd_subjob_size=1024
> 
> Would this be an OK first step?

Yes, this would be great.

> 
> If so, we're still in the 5.3 merge window, I'll see what I can do.

Shall I proceed with a patch adding the dm_mod.kcopyd_subjob_size
modparam?

Thanks,
Nikos

> 
> Thanks,
> Mike
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
