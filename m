Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D2D8FDC5
	for <lists+dm-devel@lfdr.de>; Fri, 16 Aug 2019 10:26:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C6BAD3001FEB;
	Fri, 16 Aug 2019 08:26:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA16083B85;
	Fri, 16 Aug 2019 08:26:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9BC8C18005B9;
	Fri, 16 Aug 2019 08:26:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7G8QRRd016882 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Aug 2019 04:26:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C8521001947; Fri, 16 Aug 2019 08:26:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36F70100194E
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 08:26:24 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A3A2309BF23
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 08:26:23 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t16so737079wra.6
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 01:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=56fPS/dgJdCSM/wPNRnGXBen8t9t2W1bcanq5wh0TUQ=;
	b=PRw7PPE4b5LWXqiKs/xktokPR+OlURF/RNAvkR94hWvmbIsBuK7puDw+UFq7xRA1FL
	OIAs+ufv3BHCchuwmyq7w10SCIdzC3O60RbCS5kIRtlg81B9C+J8UY9dHBahbqW5hXPp
	KtrQTsqX66YqtX0EksHtPZGqQ1oK7AtuWJnDbX3BXh7fRo/GdhY0njCYS+lEjN6Y6uMK
	VIqNj92B+wmEKRmbUSFfeoIfFAy2Ng8LzVXI/ZjuF5j6CdEMuw0cMRCyRo6L5ipuLCDW
	nS2JTw5tQCjMBELlp2Ebh7TIUb0i5slThjRilKBgRS+WKuSQ2AN1BLtsP+envGss2N6n
	vy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=56fPS/dgJdCSM/wPNRnGXBen8t9t2W1bcanq5wh0TUQ=;
	b=snRWISW0oAOYWrlxQQHc+dkNVAXNbDkfm2yiEBha23qhTsfAPUiRNmjLQzTtzQdrWw
	hbI0PfOoTvZyWm45T/kkf3AJEN+5KYkL4gZJ7lCfXYKAjzfpFnI3xoLtskQtLH6zG7La
	G6Z/xPyzVy4MLzJzFa+JP36Z5DU5QBMagxiukix7NB359HywbD+G5pVGkZFS4QuVvQp5
	QodXs38p8U+CD+ZGZNmbff+hEVOD5lvKTiVROMQwenX3lgRV62E644PuWLjZ46F9nvlv
	0q3SmqsCXGVBO0mZ+1KnRDVfgxMxKCG5GxYhGWzTTiYMAv4+KuCzLr1jaZgjGke8fVf5
	CAVw==
X-Gm-Message-State: APjAAAX21EVOM9OBlE7ApwOMDd8567dnmqnWSIHXRFnY2zcamWgWHP51
	cXkEoq1BNxJFIjVZr6NgT7Hnq4HwL0Q=
X-Google-Smtp-Source: APXvYqyGOIj1aB2EpmHGuZNQG3fAHhYs4PTy/JhagxqHTt62717Sh77M0+5CTHy949ACc/NSB0K/Wg==
X-Received: by 2002:adf:fe08:: with SMTP id n8mr8983932wrr.60.1565943982177;
	Fri, 16 Aug 2019 01:26:22 -0700 (PDT)
Received: from [192.168.2.27] (39.35.broadband4.iol.cz. [85.71.35.39])
	by smtp.gmail.com with ESMTPSA id
	m23sm6314419wml.41.2019.08.16.01.26.21
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 16 Aug 2019 01:26:21 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <20190815192858.28125-1-ard.biesheuvel@linaro.org>
	<1463bca3-77dc-42be-7624-e8eaf5cfbf32@gmail.com>
	<CAKv+Gu9CtMMAjtjfR=uuB-+x0Lhy8gnme2HhExckW+eVZ8B_Ow@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <d509ce52-1ae1-f785-fe5a-7d5a0e2bc8d0@gmail.com>
Date: Fri, 16 Aug 2019 10:26:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu9CtMMAjtjfR=uuB-+x0Lhy8gnme2HhExckW+eVZ8B_Ow@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 16 Aug 2019 08:26:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Fri, 16 Aug 2019 08:26:23 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.362  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Fri, 16 Aug 2019 08:26:39 +0000 (UTC)

On 16/08/2019 10:18, Ard Biesheuvel wrote:
> On Fri, 16 Aug 2019 at 10:29, Milan Broz <gmazyland@gmail.com> wrote:
>>
>> Hi Ard,
>>
>> On 15/08/2019 21:28, Ard Biesheuvel wrote:
>>> Changes since v10:
>>> - Drop patches against fscrypt and dm-crypt - these will be routed via the
>>>   respective maintainer trees during the next cycle
>>
>> I tested the previous dm-crypt patches (I also try to keep them in my kernel.org tree),
>> it works and looks fine to me (and I like the final cleanup :)
>>
>> Once all maintainers are happy with the current state, I think it should go to
>> the next release (5.4; IMO both ESSIV API and dm-crypt changes).
>> Maybe you could keep sending dm-crypt patches in the end of the series (to help testing it)?
>>
> 
> OK. But we'll need to coordinate a bit so that the first patch (the
> one that introduces the template) is available in both branches,
> otherwise ESSIV will be broken in the dm branch until it hits another
> branch (-next or mainline) that also contains cryptodev.

Yes, I know. I'll ask Mike what is his preference here...
For now, it should appear at least in the cryptodev tree :)

...
 
> Any idea about the status of the EBOIV patch?

It is in the queue for 5.4 (should be in linux-next already), I guess 5.4 target is ok here.

https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/log/?h=dm-5.4

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
