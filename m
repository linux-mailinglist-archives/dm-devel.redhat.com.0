Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B712DCFD
	for <lists+dm-devel@lfdr.de>; Wed, 29 May 2019 14:27:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 410123091DC4;
	Wed, 29 May 2019 12:27:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1BD45D784;
	Wed, 29 May 2019 12:26:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFB74C840;
	Wed, 29 May 2019 12:26:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TCOLLO025703 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 08:24:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6238B28991; Wed, 29 May 2019 12:24:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BC051972C;
	Wed, 29 May 2019 12:24:14 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E4BF9FFCE;
	Wed, 29 May 2019 12:23:58 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id g9so1510822pfo.11;
	Wed, 29 May 2019 05:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=rxy6f9sl7ikW/ApsyD3MIdMjQRls/RXr9QjpSHSk8IA=;
	b=elr4QUjPLJwgjRzDF9BPlt/vZkivc4ga4UEo4Zq86R8hcJtmPGwox7ezM3W6F104Du
	CzrX7DY2q9O698Vr2XF+s0v8TTsrt/rMWXDZNHqSJXyKxsmmS3dY8miZukr4FymbQo+n
	GlyPyvFM3VQZ84Sr/5h6pRYnlymy63SPze+sFh5mlmZ5PucglFPOkonCfW2xH+0Rmqiq
	EBbAna95JOUV65pbNYaG/ZG7E+eih/E4FlBX4l8n36bOzIeco2JglNVpgHMoADj6LIx6
	Olz5oKpmJQ1tcZS/O7kmeRAKeE3YrIRq3mYi3PS/nThUPgd5yy1BhQMIR12/OQbOwKkj
	NfQA==
X-Gm-Message-State: APjAAAUTlkWE5pNTBWXUbYSci7Vs1ayxGtKL85n3ZnUXrzCnnbxaxY5Q
	+KzGZxHVjt7XmqgmV+okbuk=
X-Google-Smtp-Source: APXvYqw3gtP9GYIe9PKp/7Bwfo/J4hxf31+bvFoTQDtU0F9p+8zHqc+Inc7h1cd1ACTxH/qzERMEvw==
X-Received: by 2002:a17:90a:778b:: with SMTP id
	v11mr12193208pjk.132.1559132635974; 
	Wed, 29 May 2019 05:23:55 -0700 (PDT)
Received: from asus.site (c-67-188-93-131.hsd1.ca.comcast.net. [67.188.93.131])
	by smtp.gmail.com with ESMTPSA id
	e16sm5619309pjp.16.2019.05.29.05.23.54
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 05:23:55 -0700 (PDT)
To: Gen Zhang <blackgod016574@gmail.com>, agk@redhat.com, snitzer@redhat.com, 
	dm-devel@redhat.com
References: <20190529013320.GA3307@zhanggen-UX430UQ>
From: Bart Van Assche <bvanassche@acm.org>
Openpgp: preference=signencrypt
Autocrypt: addr=bvanassche@acm.org; prefer-encrypt=mutual; keydata=
	mQENBFSOu4oBCADcRWxVUvkkvRmmwTwIjIJvZOu6wNm+dz5AF4z0FHW2KNZL3oheO3P8UZWr
	LQOrCfRcK8e/sIs2Y2D3Lg/SL7qqbMehGEYcJptu6mKkywBfoYbtBkVoJ/jQsi2H0vBiiCOy
	fmxMHIPcYxaJdXxrOG2UO4B60Y/BzE6OrPDT44w4cZA9DH5xialliWU447Bts8TJNa3lZKS1
	AvW1ZklbvJfAJJAwzDih35LxU2fcWbmhPa7EO2DCv/LM1B10GBB/oQB5kvlq4aA2PSIWkqz4
	3SI5kCPSsygD6wKnbRsvNn2mIACva6VHdm62A7xel5dJRfpQjXj2snd1F/YNoNc66UUTABEB
	AAG0JEJhcnQgVmFuIEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPokBOQQTAQIAIwUCVI67
	igIbAwcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFcPTXFzhAJ8QkH/1AdXblKL65M
	Y1Zk1bYKnkAb4a98LxCPm/pJBilvci6boefwlBDZ2NZuuYWYgyrehMB5H+q+Kq4P0IBbTqTa
	jTPAANn62A6jwJ0FnCn6YaM9TZQjM1F7LoDX3v+oAkaoXuq0dQ4hnxQNu792bi6QyVdZUvKc
	macVFVgfK9n04mL7RzjO3f+X4midKt/s+G+IPr4DGlrq+WH27eDbpUR3aYRk8EgbgGKvQFdD
	CEBFJi+5ZKOArmJVBSk21RHDpqyz6Vit3rjep7c1SN8s7NhVi9cjkKmMDM7KYhXkWc10lKx2
	RTkFI30rkDm4U+JpdAd2+tP3tjGf9AyGGinpzE2XY1K5AQ0EVI67igEIAKiSyd0nECrgz+H5
	PcFDGYQpGDMTl8MOPCKw/F3diXPuj2eql4xSbAdbUCJzk2ETif5s3twT2ER8cUTEVOaCEUY3
	eOiaFgQ+nGLx4BXqqGewikPJCe+UBjFnH1m2/IFn4T9jPZkV8xlkKmDUqMK5EV9n3eQLkn5g
	lco+FepTtmbkSCCjd91EfThVbNYpVQ5ZjdBCXN66CKyJDMJ85HVr5rmXG/nqriTh6cv1l1Js
	T7AFvvPjUPknS6d+BETMhTkbGzoyS+sywEsQAgA+BMCxBH4LvUmHYhpS+W6CiZ3ZMxjO8Hgc
	++w1mLeRUvda3i4/U8wDT3SWuHcB3DWlcppECLkAEQEAAYkBHwQYAQIACQUCVI67igIbDAAK
	CRBxXD01xc4QCZ4dB/0QrnEasxjM0PGeXK5hcZMT9Eo998alUfn5XU0RQDYdwp6/kMEXMdmT
	oH0F0xB3SQ8WVSXA9rrc4EBvZruWQ+5/zjVrhhfUAx12CzL4oQ9Ro2k45daYaonKTANYG22y
	//x8dLe2Fv1By4SKGhmzwH87uXxbTJAUxiWIi1np0z3/RDnoVyfmfbbL1DY7zf2hYXLLzsJR
	mSsED/1nlJ9Oq5fALdNEPgDyPUerqHxcmIub+pF0AzJoYHK5punqpqfGmqPbjxrJLPJfHVKy
	goMj5DlBMoYqEgpbwdUYkH6QdizJJCur4icy8GUNbisFYABeoJ91pnD4IGei3MTdvINSZI5e
Message-ID: <fcf2c3c0-e479-9e74-59d5-79cd2a0bade6@acm.org>
Date: Wed, 29 May 2019 05:23:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529013320.GA3307@zhanggen-UX430UQ>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 29 May 2019 12:23:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Wed, 29 May 2019 12:23:58 +0000 (UTC) for IP:'209.85.210.194'
	DOMAIN:'mail-pf1-f194.google.com'
	HELO:'mail-pf1-f194.google.com' FROM:'bart.vanassche@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.191  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.194 mail-pf1-f194.google.com 209.85.210.194
	mail-pf1-f194.google.com <bart.vanassche@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH] dm-init: fix 2 incorrect use of kstrndup()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 29 May 2019 12:27:56 +0000 (UTC)

On 5/28/19 6:33 PM, Gen Zhang wrote:
> In drivers/md/dm-init.c, kstrndup() is incorrectly used twice.
> 
> It should be: char *kstrndup(const char *s, size_t max, gfp_t gfp);

Should the following be added to this patch?

Fixes: 6bbc923dfcf5 ("dm: add support to directly boot to a mapped
device") # v5.1.
Cc: stable

Thanks,

Bart.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
