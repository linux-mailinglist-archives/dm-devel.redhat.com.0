Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DAAB97BD
	for <lists+dm-devel@lfdr.de>; Fri, 20 Sep 2019 21:22:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C9C736899;
	Fri, 20 Sep 2019 19:22:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E2BD5C1B5;
	Fri, 20 Sep 2019 19:22:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 295D183546;
	Fri, 20 Sep 2019 19:22:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8KJLh8f001775 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 20 Sep 2019 15:21:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2C61D5D6B2; Fri, 20 Sep 2019 19:21:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx21.extmail.prod.ext.phx2.redhat.com
	[10.5.110.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 109755D6B0;
	Fri, 20 Sep 2019 19:21:38 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4587518C426B;
	Fri, 20 Sep 2019 19:21:37 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v8so7912849wrt.2;
	Fri, 20 Sep 2019 12:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=PJyeClMQVfNi5aFiPW4+LQNcu88byDAQ1TqGQo4z/1g=;
	b=a3VFKP3pP7MsgoR9+U3VItQ4jCWJoGV9jijSEb+eqgTlAziNCCnavHxtgIFsD5J95R
	g/cCazSjQSATWLk0WQEygPus1eLmpmmfRaw1bYPrh6OI5CGl3HB65VzcLNMDcEIk690x
	8B5uS9XkRPcKshYWtDUR5DyJ1dZGPD2JjFeY4PEKM9J6xg0Yp9Bzn3Kl3Ofli6LThZXx
	NHZkfo903VKQS/izbH1VPZTgb5gNPYBkesO0p4bO8ubWOmKDaqxdAoUBTcyWgaTycd8s
	ROznvdCjMZdGL2EOcBN1jlgyYbRASLU0gv/+7ZIBchCqwYQrvJDQjdoazEv7kBFZpabQ
	HsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PJyeClMQVfNi5aFiPW4+LQNcu88byDAQ1TqGQo4z/1g=;
	b=k4NuwAm0T2pFC+qJEwBrJQwwdXQXAEXI77NdAHQ5wPG4SlKCnVsZBxL+RVHrVqAYsf
	a3eFBzpXHUq2EQfMcHAmdef2KuKyeHT4k7ogBYq6q4pmiCS6kShyVl4h71SRJyD6E4Kd
	XsbyvGgQxJp0ev0kQRvPj7jqTjEp1id2OvIDklrIIPFf2WJeVb1nKbTovWEkSIaY/zwp
	8eeLHEvo4W3zDoLY/j/4HUjfhEO+A8ZNAIQQ4QR3B3q0fbkDTcx4HJr6N2Zi0bOu2Ekr
	I9s2SDsZTj6PPHTo0ZFWGtZF8dASMHutxVpR12uK8iUpwmdQXs6R2QUoYpWsD/GuT4Gv
	MW/A==
X-Gm-Message-State: APjAAAXvwmRdKeiybEAuSqQqtSaP5MCmTiDL3dwoN0XWZeWRvrZUOdss
	+omOlQAamDTXyF+VsahWMiY=
X-Google-Smtp-Source: APXvYqziOU8XeRx1ViKOkNnAeYNxQKqLPgBJKUiE52oKkbZ40GHXI1ev8ZeIJvOvn1qG3Edkg03rmA==
X-Received: by 2002:a5d:5352:: with SMTP id t18mr13608922wrv.72.1569007295889; 
	Fri, 20 Sep 2019 12:21:35 -0700 (PDT)
Received: from [192.168.2.28] (39.35.broadband4.iol.cz. [85.71.35.39])
	by smtp.gmail.com with ESMTPSA id o9sm4917013wrh.46.2019.09.20.12.21.34
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 20 Sep 2019 12:21:35 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>,
	Thibaut Sautereau <thibaut.sautereau@clip-os.org>
References: <20190920154434.GA923@gandi.net>
	<20190920173707.GA21143@redhat.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <13e25b01-f344-ea1d-8f6c-9d0a60eb1e0f@gmail.com>
Date: Fri, 20 Sep 2019 21:21:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190920173707.GA21143@redhat.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.62]);
	Fri, 20 Sep 2019 19:21:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]);
	Fri, 20 Sep 2019 19:21:37 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.62
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm-crypt error when CONFIG_CRYPTO_AUTHENC is disabled
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Fri, 20 Sep 2019 19:22:25 +0000 (UTC)

On 20/09/2019 19:37, Mike Snitzer wrote:
> On Fri, Sep 20 2019 at 11:44am -0400,
> Thibaut Sautereau <thibaut.sautereau@clip-os.org> wrote:
> 
>> Hi,
>>
>> I just got a dm-crypt "crypt: Error allocating crypto tfm" error when
>> trying to "cryptsetup open" a volume. I found out that it was only
>> happening when I disabled CONFIG_CRYPTO_AUTHENC.
>>
>> drivers/md/dm-crypt.c includes the crypto/authenc.h header and seems to
>> use some CRYPTO_AUTHENC-related stuff. Therefore, shouldn't
>> CONFIG_DM_CRYPT select CONFIG_CRYPTO_AUTHENC?
> 
> Yes, it looks like commit ef43aa38063a6 ("dm crypt: add cryptographic
> data integrity protection (authenticated encryption)") should've added
> 'select CRYPTO_AUTHENC' to dm-crypt's Kconfig.  I'll let Milan weigh-in
> but that seems like the right way forward.

No, I don't this so. It is like you use some algorithm that is just not compiled-in,
or it is disabled in the current state (because of FIPS mode od so) - it fails
to initialize it.

I think we should not force dm-crypt to depend on AEAD - most users
do not use authenticated encryption, it is perfectly ok to keep this compiled out.

I do not see any principal difference from disabling any other crypto
(if you disable XTS mode, it fails to open device that uses it).

IMO the current config dependence is ok.

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
