Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 760ED24926
	for <lists+dm-devel@lfdr.de>; Tue, 21 May 2019 09:41:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5BDA307CDFC;
	Tue, 21 May 2019 07:41:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3219F5D9D5;
	Tue, 21 May 2019 07:41:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1FCFA1806B0F;
	Tue, 21 May 2019 07:41:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4L7cpj4027616 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 May 2019 03:38:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3D5F960C81; Tue, 21 May 2019 07:38:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19EF1646B8;
	Tue, 21 May 2019 07:38:47 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D6D1C04BE32;
	Tue, 21 May 2019 07:38:38 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g12so17033318wro.8;
	Tue, 21 May 2019 00:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=5ryJbbZodXACWTO9xzLjJVVDfVukY2SjZqE/RR5ZRyY=;
	b=nqw8oc680iMAXhEvqTRlU54E1joqR2AvVBhvZfLCL7BBx/cJuYXEsr2tIKWi9s/noe
	OyAh63/DLuZBsMo4BQnTIiH7d2J3BTTStDZ11VOlWi6H4zlhecsZStdaOK9Y/gUzRgcj
	7SLMARSMr3T9KqOGhrDNMx8/4OdVO6LE2S1HO/maHyEHUbEHu9/H6GWOkYa6upqiwApD
	Ys5KRsRW9HudhzP/+KX9j1ouXQsqo0IdByIvhVy2ZWMEtNnWtMiPZA/xxFeFKc56E5zH
	4RbOk04KtUI/edTwJzfndt6RAb47JGe5IUqvSXD3ZKeEIlLc0NeynN1bNwcoj9tjOb4x
	xXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5ryJbbZodXACWTO9xzLjJVVDfVukY2SjZqE/RR5ZRyY=;
	b=LJ9v9Mw8KyVCzS1EXAtzU4SthheWYsLP+qVbvhloIIKfcOgyFzveM6AipFD/p+iyJk
	IQ01qMRZNtHuMSo6HpLjxL3iwE7VYZusbP+X0ZFr5QdjPRrT8v+TauBOUAOZKe3HyEfT
	SmL0ZW0qcD/cl7SAefOqIq++dKSxFj9SUUWheK6DKccPA2f+LmlJL5f3nlSP+SN35P36
	cHMT9ZQ4nzbgdyzPDyFlhn+Apdok5twQkTzNTyn4q+7Hrb1xizT7ILAgZHSrRrdM5uId
	THSSNKAFIOWCkPw8aYbNLIi/xK9Y49TSQZDgu98l7fqryrUpMM5Ll3GyMTh8yTWU8XRJ
	wIVg==
X-Gm-Message-State: APjAAAW1l30dLAzbJwfUbFxER0Dh9g0rrHPWG3T2blrEqLecTcZijjON
	h5tpTIlsXh8KHBx4lZXYFZ0=
X-Google-Smtp-Source: APXvYqwfLIm49NnDDXdp9jn68Vl7JSM+PaLLfYbbHu9fobHWezVc5/071lrqi5iSH9Bh8drGE7n0mA==
X-Received: by 2002:a5d:4002:: with SMTP id n2mr13890891wrp.187.1558424316584; 
	Tue, 21 May 2019 00:38:36 -0700 (PDT)
Received: from [10.43.17.31] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id
	a10sm23974617wrm.94.2019.05.21.00.38.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 00:38:36 -0700 (PDT)
To: Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190520215422.23939-1-jaskarankhurana@linux.microsoft.com>
	<20190520215422.23939-2-jaskarankhurana@linux.microsoft.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <7e922983-7716-e215-a29b-3154f7afb493@gmail.com>
Date: Tue, 21 May 2019 09:38:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520215422.23939-2-jaskarankhurana@linux.microsoft.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 21 May 2019 07:38:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Tue, 21 May 2019 07:38:38 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.109  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, snitzer@redhat.com, agk@redhat.com, jmorris@namei.org
Subject: Re: [dm-devel] [RFC 1/1] Add dm verity root hash pkcs7 sig
	validation.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Tue, 21 May 2019 07:41:21 +0000 (UTC)

On 20/05/2019 23:54, Jaskaran Khurana wrote:
> Adds in-kernel pkcs7 signature checking for the roothash of
> the dm-verity hash tree.
> 
> The verification is to support cases where the roothash is not secured by
> Trusted Boot, UEFI Secureboot or similar technologies.
> One of the use cases for this is for dm-verity volumes mounted after boot,
> the root hash provided during the creation of the dm-verity volume has to
> be secure and thus in-kernel validation implemented here will be used
> before we trust the root hash and allow the block device to be created.
> 
> The signature being provided for verification must verify the root hash and 
> must be trusted by the builtin keyring for verification to succeed.
> 
> Adds DM_VERITY_VERIFY_ROOTHASH_SIG: roothash verification
> against the roothash signature file *if* specified, if signature file is
> specified verification must succeed prior to creation of device mapper 
> block device.
> 
> Adds DM_VERITY_VERIFY_ROOTHASH_SIG_FORCE: roothash signature *must* be
> specified for all dm verity volumes and verification must succeed prior
> to creation of device mapper block device.

I am not sure this is a good idea. If I understand it correctly, this will
block creating another dm-verity mappings without PKCS7 signature, and these
are used in many other environments and applications that could possibly
run on that system later.

(But I have no idea how to solve it better though :-)

...

> +	/* Root hash signature is  a optional parameter*/
> +	r = verity_verify_root_hash(root_hash_digest_to_validate,
> +				    strlen(root_hash_digest_to_validate),
> +				    verify_args.sig,
> +				    verify_args.sig_size);
> +	if (r < 0) {
> +		ti->error = "Root hash verification failed";
> +		goto bad;
> +	}

You are sending the PKCS7 signature as a (quite large) binary blob inside the mapping table.

I am not sure if it is possible here (I guess so), but why not put this it kernel keyring
and then just reference it from mapping table?
(We use kernel keyring in libcryptsetup already for dm-crypt.)

It will also solve an issue in userspace patch, when you are reading the signature
file too late (devices can be suspended in that moment, so I would prefer to download
sig file to keyring in advance, and then just reference it in mapping table).

(I guess you will send merge request for veritysetup userspace part later.)

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
