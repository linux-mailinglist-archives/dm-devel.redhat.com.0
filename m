Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D718899108
	for <lists+dm-devel@lfdr.de>; Thu, 22 Aug 2019 12:38:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7B6510C6968;
	Thu, 22 Aug 2019 10:38:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC2806012A;
	Thu, 22 Aug 2019 10:38:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11B961802217;
	Thu, 22 Aug 2019 10:38:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7LEGjO3010448 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 21 Aug 2019 10:16:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 969565C1D6; Wed, 21 Aug 2019 14:16:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx26.extmail.prod.ext.phx2.redhat.com
	[10.5.110.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F8805C21A
	for <dm-devel@redhat.com>; Wed, 21 Aug 2019 14:16:40 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1FC88800DF4
	for <dm-devel@redhat.com>; Wed, 21 Aug 2019 14:16:40 +0000 (UTC)
Received: from mail-pf1-f198.google.com ([209.85.210.198])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1i0RPi-0001QS-En
	for dm-devel@redhat.com; Wed, 21 Aug 2019 14:16:38 +0000
Received: by mail-pf1-f198.google.com with SMTP id r130so1699953pfc.0
	for <dm-devel@redhat.com>; Wed, 21 Aug 2019 07:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Go+GEHhUcbN1bHosP4BsuQGAO6IN3p1GHI03GXEZEAE=;
	b=jGheJC++cNz1CoxljnhQ/CQ0jmYN+BR3ODall7aWWpMFHVElORcQALzHgJOdDU7wqN
	1yqAyydbSueKxAP/dMeWcej5of7P+G3LlMmqO7QQMmKo16pm2MBKcMdJ9b6Eskf2f1GV
	1yA4BUNjo10GqcaLrjvLEkoC2+lZ35OYWVMOhcKR9Le30M+xYsDne02lX0JdpYzBKpsA
	+qpA4aY+v4U8eqlOe73LinHoYQhYWCpyCdEQfcEPQfya1yX+83b2bl99WJUp7C71nKzB
	vy2bCt5ZtWwf5gMj1IkWVy+cG5crHC516b0uP9oIbxCODgQCAD6Q40JlahI3uSgN8PJ3
	/q5A==
X-Gm-Message-State: APjAAAU5F+SKJDPqBFRq6RcjzGH9qPR652MS+ig0Tj9+P3p3TpNZsYX5
	ztTRDONkyF8ccUFfYcw1fzR3C25gLLcdBj6XXLghUJs2b02f6tCZvqIQRoZnFs4Qiuykkb16U29
	dtyUZp6YOyUSl+EJi9iV23+lIiGxBgA==
X-Received: by 2002:a17:90b:8e:: with SMTP id bb14mr204493pjb.35.1566396996932;
	Wed, 21 Aug 2019 07:16:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxAjW0ZfAAXYn4C5kkD1j8vOncVe99b8Y9EmPCf9G9eITmAA4IV8N6JlbdPHP10+0fky8YxRw==
X-Received: by 2002:a17:90b:8e:: with SMTP id bb14mr204473pjb.35.1566396996764;
	Wed, 21 Aug 2019 07:16:36 -0700 (PDT)
Received: from [192.168.1.75] ([191.13.61.137])
	by smtp.gmail.com with ESMTPSA id
	g36sm41138577pgb.78.2019.08.21.07.16.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Aug 2019 07:16:35 -0700 (PDT)
To: Song Liu <songliubraving@fb.com>
References: <20190816134059.29751-1-gpiccoli@canonical.com>
	<CAPhsuW7aGze5p9DgNAe=KakJGXTNqRZpNCtvi8nKxzS2MPXrNQ@mail.gmail.com>
	<1f16110b-b798-806f-638b-57bbbedfea49@canonical.com>
	<1725F15D-7CA2-4B8D-949A-4D8078D53AA9@fb.com>
	<4c95f76c-dfbc-150c-2950-d34521d1e39d@canonical.com>
	<8E880472-67DA-4597-AFAD-0DAFFD223620@fb.com>
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
Message-ID: <c35cd395-fc54-24c0-1175-d3ea0ab0413d@canonical.com>
Date: Wed, 21 Aug 2019 11:16:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8E880472-67DA-4597-AFAD-0DAFFD223620@fb.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.67]); Wed, 21 Aug 2019 14:16:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]);
	Wed, 21 Aug 2019 14:16:40 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.67
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 22 Aug 2019 06:38:34 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Song Liu <liu.song.a23@gmail.com>, NeilBrown <neilb@suse.com>,
	linux-raid <linux-raid@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: Re: [dm-devel] [PATCH v2 1/2] md raid0/linear: Introduce new array
 state 'broken'
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]); Thu, 22 Aug 2019 10:38:56 +0000 (UTC)

On 19/08/2019 18:57, Song Liu wrote:
> [...]
> How about we test this when we do clear_bit(Faulty..)? And maybe also in 
> add_new_disk()?
> 
> Thanks,
> Song
> 

Song, thanks for the suggestions. I've been working in the refactor, so
far it's working fine. But I cannot re-add a member to raid0/linear
without performing a full stop (with "mdadm --stop"), and in this case
md_clean() will clear the flag. Restarting array this way works fine.

If I try writing 'inactive' to array_state, I cannot reinsert the member
to the array. That said, I don't think we need to worry in clearing
MD_BROKEN for RAID0/LINEAR, and it makes things far easier.
Are you ok with that? I'll submit V3 after our discussion.

Thanks,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
