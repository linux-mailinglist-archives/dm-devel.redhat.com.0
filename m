Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1787BD44
	for <lists+dm-devel@lfdr.de>; Wed, 31 Jul 2019 11:34:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9195F3084051;
	Wed, 31 Jul 2019 09:34:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EA9110016E8;
	Wed, 31 Jul 2019 09:34:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F274C1800205;
	Wed, 31 Jul 2019 09:34:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6UCUme3027588 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jul 2019 08:30:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BFE2F5D978; Tue, 30 Jul 2019 12:30:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9CC15D96F
	for <dm-devel@redhat.com>; Tue, 30 Jul 2019 12:30:46 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E47F30A6986
	for <dm-devel@redhat.com>; Tue, 30 Jul 2019 12:30:45 +0000 (UTC)
Received: from mail-pl1-f198.google.com ([209.85.214.198])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1hsRHA-0005jc-0w
	for dm-devel@redhat.com; Tue, 30 Jul 2019 12:30:44 +0000
Received: by mail-pl1-f198.google.com with SMTP id u10so35220915plq.21
	for <dm-devel@redhat.com>; Tue, 30 Jul 2019 05:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=epsg8o9SJ8QYu2h+n3GBIMR7ashpfZp82u6PNELR9R0=;
	b=g/gWoKoS8t6/r8us2ZiyLax3ZReXTKjBtec40QBW0yyQbAp6HpJjghDc53/aTdt2z7
	/Nxi4f1uk8ygvgjjfqHvEtUObslm+slVlOIU4L7I8YdVuuNw5iVCeXTL6taT5yZSNirC
	pamgm81ya9UqlWFsw2qk/EHaLBbWmOjpGymmdujobJTZiIdeO1w446A+nEUcClDl6P+X
	JHLb2MFd+g3EhZ8QiR2//v+bCy8Q8YcurRnfQxEQqm39YoTqzfQ+4YJFwcB9qizjXp4D
	ntColeJ5lhUqQsQuhjLxEraiCMCFbGGLVcrqHtysX8TfRs3PSgtljmt6oF3cYfZmuYG2
	XO1g==
X-Gm-Message-State: APjAAAVMZkGISmZDVVVBC8ntGGpDuRoCn0QQ33k4fkV0Cqv2IZRPLtSu
	aoG9Cj8+u2Or+TT0/rSb+4K05s7jjiW7ou0b2+UPfYMNCwLoUENNNeQKUPU1KFjy3mnEJ+nbf6r
	86HwiwQuTE8mv3k8mSrE6ga644v2EZA==
X-Received: by 2002:a17:902:8a94:: with SMTP id
	p20mr114567051plo.312.1564489842819; 
	Tue, 30 Jul 2019 05:30:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy0VsDJiydDk2IU/zaDnE7MxD9OWWEeZZZ3QAEoamnUMMOh2M43oOlEha15TE8IWLdFKfsSxA==
X-Received: by 2002:a17:902:8a94:: with SMTP id
	p20mr114567041plo.312.1564489842701; 
	Tue, 30 Jul 2019 05:30:42 -0700 (PDT)
Received: from [192.168.1.202] ([152.254.214.186])
	by smtp.gmail.com with ESMTPSA id
	85sm69146580pfv.130.2019.07.30.05.30.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jul 2019 05:30:41 -0700 (PDT)
To: NeilBrown <neilb@suse.com>, linux-raid@vger.kernel.org
References: <20190729193359.11040-1-gpiccoli@canonical.com>
	<87zhkwl6ya.fsf@notabene.neil.brown.name>
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
Message-ID: <6400083b-3cf3-cbc6-650a-c3ae6629b14c@canonical.com>
Date: Tue, 30 Jul 2019 09:30:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87zhkwl6ya.fsf@notabene.neil.brown.name>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Tue, 30 Jul 2019 12:30:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Tue, 30 Jul 2019 12:30:45 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 31 Jul 2019 05:34:14 -0400
Cc: linux-block@vger.kernel.org, jay.vosburgh@canonical.com,
	Song Liu <songliubraving@fb.com>, dm-devel@redhat.com,
	Neil F Brown <nfbrown@suse.com>
Subject: Re: [dm-devel] [PATCH] md/raid0: Fail BIOs if their underlying
 block device is gone
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Wed, 31 Jul 2019 09:34:34 +0000 (UTC)

On 29/07/2019 21:08, NeilBrown wrote:
>[...]
>> +	if (unlikely(test_bit(MD_BROKEN, &mddev->flags))) {
>> +		bio_io_error(bio);
>> +		return BLK_QC_T_NONE;
>> +	}
> 
> I think this should only fail WRITE requests, not READ requests.
> 
> Otherwise the patch is probably reasonable.
> 
> NeilBrown

Thanks for the feedback Neil! I thought about it; it seemed to me better
to deny/fail the reads instead of returning "wrong" reads, since a file
read in a raid0 will be incomplete if one member is missing.
But it's fine for me to change that in the next iteration of this patch.

Cheers,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
