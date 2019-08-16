Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C1E8FC4E
	for <lists+dm-devel@lfdr.de>; Fri, 16 Aug 2019 09:30:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2242D7FDCA;
	Fri, 16 Aug 2019 07:30:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9610E8424A;
	Fri, 16 Aug 2019 07:30:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31B412551C;
	Fri, 16 Aug 2019 07:30:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7G7TmnI014999 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Aug 2019 03:29:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2AE4619C6A; Fri, 16 Aug 2019 07:29:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 223BF43FF6
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 07:29:44 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 05D7A5945E
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 07:29:43 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 207so3249828wma.1
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 00:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=6T0bWUoTVdcz2Y9O6ErDfWcGr4YZCTpQWIAXvrd/4WI=;
	b=RjWBTg/MXGdeu2r68x7GP0ppDHCxGdyk5T7+NGyr9Lk1QRpaY6xtEdYpdARwa3b6mf
	CcE3rMWREZKcB8MJoZTimYSG4g+u7kSFdG8KZWpxcYfU79ipV6IpGxIRc2m8lY78bPUR
	BJ57EQ4YoaJDJr6xXYNcuVguojvoqh4ixCIJYl+3tBw02N/71HLyOnMwuNoR8+G8dD+4
	VblSwAIkzf318BOJZJFTMMZnwf6aUXPxi01VQV2+KH7NuFXP2r0boG+sn/VuZpFNlAGG
	CPaWGosn+NxCrUYZQ4O8PUd9Pug1Lru/QPjNI+oUeO49dCwtyUhnQA9JyWReIo5U3rlL
	2AWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6T0bWUoTVdcz2Y9O6ErDfWcGr4YZCTpQWIAXvrd/4WI=;
	b=sPAeRskifkfClwXY/wxQWlHlUD5xIK1J6xO+WU/miq1K/CBUhSIt7javJAIUwg2JpY
	vbca9usXWuNJ3UrLGgHpw/fxVox0EgfS7aZzSoKQWlRw6OEmzhWz95kgNTvKZx4891PG
	Zl2MsU9HPYh7UBZf1q0SYtj36DWpuwI6IpNqcPgbj9xwnnJUCsWYTFTqg+YftGPZ257F
	G3q5rrIH67bvCPtl7ILRnoO9GH57xRXqJSwCdIUEYbK64nxh9eFRoo08eCANVkgAsc7i
	4JnFLBCoUIdhvHlTWkuQg6IOHP2BhZTpIhK6jg9Jh4+2E0IGqh3kHH/HklSdtOqZhQ1n
	EyMg==
X-Gm-Message-State: APjAAAUpOGQKASegtHFTEWauN4n7lnBZgSDmL0asSxl5O2geVGM98T6A
	2gzLHOC4dqkiJQUMXHrvoofEwV7gwBs=
X-Google-Smtp-Source: APXvYqwqyHlF+r6k9fpQM9dw1ygdJigLxpg8QcYq+qo6jtZ/6245MFxa7bsGW/51Ktd+URByGAuK+g==
X-Received: by 2002:a7b:c08f:: with SMTP id r15mr6030116wmh.90.1565940581702; 
	Fri, 16 Aug 2019 00:29:41 -0700 (PDT)
Received: from [192.168.2.27] (39.35.broadband4.iol.cz. [85.71.35.39])
	by smtp.gmail.com with ESMTPSA id
	f134sm4345319wmg.20.2019.08.16.00.29.40
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 16 Aug 2019 00:29:41 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-crypto@vger.kernel.org
References: <20190815192858.28125-1-ard.biesheuvel@linaro.org>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <1463bca3-77dc-42be-7624-e8eaf5cfbf32@gmail.com>
Date: Fri, 16 Aug 2019 09:29:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815192858.28125-1-ard.biesheuvel@linaro.org>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 16 Aug 2019 07:29:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Fri, 16 Aug 2019 07:29:43 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	linux-fscrypt@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>
Subject: Re: [dm-devel] [PATCH v12 0/4] crypto: switch to crypto API for
	ESSIV generation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 16 Aug 2019 07:30:15 +0000 (UTC)

Hi Ard,

On 15/08/2019 21:28, Ard Biesheuvel wrote:
> Changes since v10:
> - Drop patches against fscrypt and dm-crypt - these will be routed via the
>   respective maintainer trees during the next cycle

I tested the previous dm-crypt patches (I also try to keep them in my kernel.org tree),
it works and looks fine to me (and I like the final cleanup :)

Once all maintainers are happy with the current state, I think it should go to
the next release (5.4; IMO both ESSIV API and dm-crypt changes).
Maybe you could keep sending dm-crypt patches in the end of the series (to help testing it)?

(Just for for now I am completely distracted by other urgent unrelated issues.)

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
