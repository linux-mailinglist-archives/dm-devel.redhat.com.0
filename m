Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AA515F9B
	for <lists+dm-devel@lfdr.de>; Tue,  7 May 2019 10:42:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 09C58C057F32;
	Tue,  7 May 2019 08:42:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8893661B71;
	Tue,  7 May 2019 08:42:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CB9118089CB;
	Tue,  7 May 2019 08:42:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x46ImDkx010787 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 May 2019 14:48:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 98E75194A5; Mon,  6 May 2019 18:48:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 910E618506
	for <dm-devel@redhat.com>; Mon,  6 May 2019 18:48:11 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E583309B152
	for <dm-devel@redhat.com>; Mon,  6 May 2019 18:48:10 +0000 (UTC)
Received: from mail-qt1-f197.google.com ([209.85.160.197])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1hNiem-0007H6-Ig
	for dm-devel@redhat.com; Mon, 06 May 2019 18:48:08 +0000
Received: by mail-qt1-f197.google.com with SMTP id f4so10665826qtm.18
	for <dm-devel@redhat.com>; Mon, 06 May 2019 11:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=bC2THTg10tW16ub7PNyNptaheYbyDqPTCbofTdADo6U=;
	b=trc7Cg1pVee5L0xiIuPRC8jg3fTGq2T9qDQ/NovLMRy8lvjSexLXL/6U6lW5pBF360
	FL1AKzaE74F7IzI3IJr0TNkuGV+DNF4xXch3d4tTpT/5IxX1cZDhK8q4ga/XAcsYRyqq
	fHDW8rSalH5/Y7z2Hi5HjkUwPULzd8WgjCqTmXonJGx/+DeM1EAvSGKA7wHG0cx2eEeN
	mpJ/QwUXq/hCVJikAhoMPTX+5fhdEGfqqMgqNv3QBEJvTEPkPta6GUUeB7//x3vbBMy8
	QCSWAS08YlsmMcUPQG46sWv0bYYwxWrs1KKHoX/6RVYvmO8A12RJ6+nCwZQkNwDNNI3w
	/7Eg==
X-Gm-Message-State: APjAAAVB977qYH0UxNo5Pd4dNBvWeMPfsxe+iGqkMznLF/9AT8G1Ktca
	ANqCmWVveliOHLT479HToU7T7JwYjIGyoovKyxCNs55jZnkWqier7L4RTYZ8QH5yRWhCTppZe6G
	6pZongnWM2q5Q9R2yNW63tjaTqS5kvw==
X-Received: by 2002:ac8:1c39:: with SMTP id a54mr20851831qtk.344.1557168487498;
	Mon, 06 May 2019 11:48:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwli31XV/EPuqTTwm6MSINbZHcbpJYoivTjqAbSmdTKZRc/DelL2WjDxPfeSm6BWH7j+Norfw==
X-Received: by 2002:ac8:1c39:: with SMTP id a54mr20851815qtk.344.1557168487296;
	Mon, 06 May 2019 11:48:07 -0700 (PDT)
Received: from [192.168.0.239] ([177.183.163.179])
	by smtp.gmail.com with ESMTPSA id
	j123sm6316420qkf.23.2019.05.06.11.48.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 May 2019 11:48:06 -0700 (PDT)
To: Song Liu <liu.song.a23@gmail.com>
References: <20190430223722.20845-1-gpiccoli@canonical.com>
	<20190430223722.20845-2-gpiccoli@canonical.com>
	<CAPhsuW4SeUhNOJJkEf9wcLjbbc9qX0=C8zqbyCtC7Q8fdL91hw@mail.gmail.com>
From: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gpiccoli@canonical.com; prefer-encrypt=mutual; keydata=
	mQENBFpVBxcBCADPNKmu2iNKLepiv8+Ssx7+fVR8lrL7cvakMNFPXsXk+f0Bgq9NazNKWJIn
	Qxpa1iEWTZcLS8ikjatHMECJJqWlt2YcjU5MGbH1mZh+bT3RxrJRhxONz5e5YILyNp7jX+Vh
	30rhj3J0vdrlIhPS8/bAt5tvTb3ceWEic9mWZMsosPavsKVcLIO6iZFlzXVu2WJ9cov8eQM/
	irIgzvmFEcRyiQ4K+XUhuA0ccGwgvoJv4/GWVPJFHfMX9+dat0Ev8HQEbN/mko/bUS4Wprdv
	7HR5tP9efSLucnsVzay0O6niZ61e5c97oUa9bdqHyApkCnGgKCpg7OZqLMM9Y3EcdMIJABEB
	AAG0LUd1aWxoZXJtZSBHLiBQaWNjb2xpIDxncGljY29saUBjYW5vbmljYWwuY29tPokBNwQT
	AQgAIQUCWmClvQIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRDOR5EF9K/7Gza3B/9d
	5yczvEwvlh6ksYq+juyuElLvNwMFuyMPsvMfP38UslU8S3lf+ETukN1S8XVdeq9yscwtsRW/
	4YoUwHinJGRovqy8gFlm3SAtjfdqysgJqUJwBmOtcsHkmvFXJmPPGVoH9rMCUr9s6VDPox8f
	q2W5M7XE9YpsfchS/0fMn+DenhQpV3W6pbLtuDvH/81GKrhxO8whSEkByZbbc+mqRhUSTdN3
	iMpRL0sULKPVYbVMbQEAnfJJ1LDkPqlTikAgt3peP7AaSpGs1e3pFzSEEW1VD2jIUmmDku0D
	LmTHRl4t9KpbU/H2/OPZkrm7809QovJGRAxjLLPcYOAP7DUeltveuQENBFpVBxcBCADbxD6J
	aNw/KgiSsbx5Sv8nNqO1ObTjhDR1wJw+02Bar9DGuFvx5/qs3ArSZkl8qX0X9Vhptk8rYnkn
	pfcrtPBYLoux8zmrGPA5vRgK2ItvSc0WN31YR/6nqnMfeC4CumFa/yLl26uzHJa5RYYQ47jg
	kZPehpc7IqEQ5IKy6cCKjgAkuvM1rDP1kWQ9noVhTUFr2SYVTT/WBHqUWorjhu57/OREo+Tl
	nxI1KrnmW0DbF52tYoHLt85dK10HQrV35OEFXuz0QPSNrYJT0CZHpUprkUxrupDgkM+2F5LI
	bIcaIQ4uDMWRyHpDbczQtmTke0x41AeIND3GUc+PQ4hWGp9XABEBAAGJAR8EGAEIAAkFAlpV
	BxcCGwwACgkQzkeRBfSv+xv1wwgAj39/45O3eHN5pK0XMyiRF4ihH9p1+8JVfBoSQw7AJ6oU
	1Hoa+sZnlag/l2GTjC8dfEGNoZd3aRxqfkTrpu2TcfT6jIAsxGjnu+fUCoRNZzmjvRziw3T8
	egSPz+GbNXrTXB8g/nc9mqHPPprOiVHDSK8aGoBqkQAPZDjUtRwVx112wtaQwArT2+bDbb/Y
	Yh6gTrYoRYHo6FuQl5YsHop/fmTahpTx11IMjuh6IJQ+lvdpdfYJ6hmAZ9kiVszDF6pGFVkY
	kHWtnE2Aa5qkxnA2HoFpqFifNWn5TyvJFpyqwVhVI8XYtXyVHub/WbXLWQwSJA4OHmqU8gDl
	X18zwLgdiQ==
Message-ID: <c8721ba3-5d38-7906-5049-e2b16e967ecf@canonical.com>
Date: Mon, 6 May 2019 15:48:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAPhsuW4SeUhNOJJkEf9wcLjbbc9qX0=C8zqbyCtC7Q8fdL91hw@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Mon, 06 May 2019 18:48:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Mon, 06 May 2019 18:48:10 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -5 (RCVD_IN_DNSWL_HI) 91.189.89.112
	youngberry.canonical.com 91.189.89.112 youngberry.canonical.com
	<gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 07 May 2019 04:42:14 -0400
Cc: axboe@kernel.dk, linux-raid <linux-raid@vger.kernel.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	kernel@gpiccoli.net, stable@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Jay Vosburgh <jay.vosburgh@canonical.com>,
	Gavin Guo <gavin.guo@canonical.com>
Subject: Re: [dm-devel] [PATCH 2/2] md/raid0: Do not bypass blocking queue
 entered for raid0 bios
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 07 May 2019 08:42:38 +0000 (UTC)

On 06/05/2019 13:50, Song Liu wrote:
> [...] 
> IIUC, we need this for all raid types. Is it possible to fix that in md.c so
> all types get the fix?
> 
> Thanks,
> Song
> 

Hi Song, thanks again for reviewing my code and provide input, much
appreciated!

I understand this could in theory affects all the RAID levels, but in
practice I don't think it'll happen. RAID0 is the only "blind" mode of
RAID, in the sense it's the only one that doesn't care at all with
failures. In fact, this was the origin of my other thread [0], regarding
the change of raid0's behavior in error cases..because it currently does
not care with members being removed and rely only in filesystem failures
(after submitting many BIOs to the removed device).

That said, in this change I've only took care of raid0, since in my
understanding the other levels won't submit BIOs to dead devices; we can
experiment that to see if it's true.

But I'd be happy to change all other levels also if you think it's
appropriate (or a simple generic change to md.c if it is enough). Do you
think we could go ahead with this change, and further improve that (to
cover all raid cases if necessary)?

Cheers,


Guilherme



[0] https://marc.info/?l=linux-raid&m=155562509905735

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
