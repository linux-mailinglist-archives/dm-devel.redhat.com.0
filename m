Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 112269CA2C
	for <lists+dm-devel@lfdr.de>; Mon, 26 Aug 2019 09:24:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0120030603AA;
	Mon, 26 Aug 2019 07:24:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7BDC10016EB;
	Mon, 26 Aug 2019 07:24:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 089D8180B536;
	Mon, 26 Aug 2019 07:24:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7NHmjbe010134 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 23 Aug 2019 13:48:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E54CF5D9E5; Fri, 23 Aug 2019 17:48:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEF375D9CA
	for <dm-devel@redhat.com>; Fri, 23 Aug 2019 17:48:43 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E921A10C6967
	for <dm-devel@redhat.com>; Fri, 23 Aug 2019 17:48:42 +0000 (UTC)
Received: from mail-qk1-f198.google.com ([209.85.222.198])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1i1Dg1-0005tA-Ax
	for dm-devel@redhat.com; Fri, 23 Aug 2019 17:48:41 +0000
Received: by mail-qk1-f198.google.com with SMTP id q62so9719072qkd.3
	for <dm-devel@redhat.com>; Fri, 23 Aug 2019 10:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=wrt5oy4/Lk/zn6biMDS3TaRM8Qzmqq5AAbCxGGgNO9E=;
	b=PJhiUEA14OWH5fFwJBnG1260Hh7pPLBeXffxxlyy/x7/ArXdHatVl+PkWn7Z5z0R6h
	bbL2iQ8yr/7/iCcNVSDgnC/GWVCbcCugNmoIyiof1SWuIPvrvVQ41YQakjfDZyvLQXzc
	TLTIsxhqn1FOzOeD+d8oZeyKrrS2oxxRp6HAMWpefLZVxd9drsWNvGHQ5pZT5WSKJQw2
	BuOS7cJ8nRIK2BdxQWHoUpPjNnhRR36nLzZgUDEzr5om9C54S50C8pyee8TxDFArJWau
	ZR1fJ3bkeYRT0ph9PEoBxtEyCHjdUJZXRqBg+JYYHY+T6VnUY8h5kiNrQGtj7Qq5ftkR
	8O0A==
X-Gm-Message-State: APjAAAVt6IxYvsyNC6bR+YJMe2TDReywuImuuOOUe4txkDxSTQmppQVp
	+hJZ7IINw7usrKzVJ9beVaYUl9prCnf7KwiGC/p4QG94MkuEg3TFaYTIgNKFyeScwJGYKfOJ6Eb
	SGFXB/qENjs5DkMD8x/oYxGlw2NZSvw==
X-Received: by 2002:a0c:f150:: with SMTP id y16mr4885551qvl.28.1566582520518; 
	Fri, 23 Aug 2019 10:48:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwwYP83/BgBuHVGv5cpEZgKntXVceneWtqqF1OgQ0t61fb4vlyiuPP6uSFK2wjjwHC57/ohbQ==
X-Received: by 2002:a0c:f150:: with SMTP id y16mr4885521qvl.28.1566582520245; 
	Fri, 23 Aug 2019 10:48:40 -0700 (PDT)
Received: from [192.168.1.203] ([191.13.61.137])
	by smtp.gmail.com with ESMTPSA id
	x15sm1619991qki.48.2019.08.23.10.48.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Aug 2019 10:48:39 -0700 (PDT)
To: Song Liu <songliubraving@fb.com>
References: <20190822161318.26236-1-gpiccoli@canonical.com>
	<73C4747E-7A9E-4833-8393-B6A06C935DBE@fb.com>
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
Message-ID: <8163258e-839c-e0b8-fc4b-74c94c9dae1d@canonical.com>
Date: Fri, 23 Aug 2019 14:48:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <73C4747E-7A9E-4833-8393-B6A06C935DBE@fb.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.65]); Fri, 23 Aug 2019 17:48:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Fri, 23 Aug 2019 17:48:43 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 26 Aug 2019 03:24:39 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Song Liu <liu.song.a23@gmail.com>, NeilBrown <neilb@suse.com>,
	linux-raid <linux-raid@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: Re: [dm-devel] [PATCH v3 1/2] md raid0/linear: Mark array as
 'broken' and fail BIOs if a member is gone
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Mon, 26 Aug 2019 07:24:49 +0000 (UTC)

On 22/08/2019 18:55, Song Liu wrote:
> [...] 
>> +	if (unlikely(!(tmp_dev->rdev->bdev->bd_disk->flags & GENHD_FL_UP))) {
>> +		if (!test_bit(MD_BROKEN, &mddev->flags))
>> +			pr_warn("md: %s: linear array has a missing/failed member\n",
>> +				mdname(mddev));
>> +		set_bit(MD_BROKEN, &mddev->flags);
>> +		bio_io_error(bio);
>> +		return true;
>> +	}
>> +
> 
> Maybe we can somehow put this block in a helper and use it in both raid0
> and linear code?
> 
> Otherwise, looks good to me. 
> 
> Thanks,
> Song
> 

OK, so something as a function with a prototype like
"void md_is_broken(struct md_rdev *rd, const char *md_type)"
is good for you?
Then we can use that as the check if a member failed and in positive
case, we can print the message (if not printed before) and return to the
raid0/linear driver in order it fails the bio and returns.
I'd prefer keeping the bio out of the helper, agreed?

If you have suggestion for a better name, let me know.
Thanks,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
