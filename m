Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD4958263
	for <lists+dm-devel@lfdr.de>; Thu, 27 Jun 2019 14:20:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B659308302F;
	Thu, 27 Jun 2019 12:20:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 009E15C231;
	Thu, 27 Jun 2019 12:20:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E8F31833002;
	Thu, 27 Jun 2019 12:19:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5RCHhhu011586 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Jun 2019 08:17:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9CB46608CA; Thu, 27 Jun 2019 12:17:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2039A60856;
	Thu, 27 Jun 2019 12:17:39 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E37686679;
	Thu, 27 Jun 2019 12:17:27 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k11so2330956wrl.1;
	Thu, 27 Jun 2019 05:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8o+V9On0cYn/aqt2ZcRkFPjvUM6HJYXypZNhKOE3H1E=;
	b=Z3vNLv2Kk05ZzRZ+UH0G+dSj+W0LCAkYmCmgFW89H9gTfJoaGg7iKukKDCVXTXinfr
	T4qBQrGiQzCd7sTH0sSk7Pryv157+wiNjZ3hRdcpVRrCeVJu7vPP7sbPoZoAAT7f50hn
	JIHDNBXvVrv77LuujV65KSFnfNXhoKd1vq3CPBUinsuz3khDif+39F5TqYnBCHG9DiKN
	40vdE8hagRxHi9jlZTNZxpotPyme9lS/zSzHzqvgTpjda+XZhB11osgOEJdCJeXptT6r
	7+n9RspuTzRyMhcleXb/F64yUN2WEbCOyKP4bDchQ2Q9ZjfnbeiRzEFNsC6HqeTAPWEO
	DJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8o+V9On0cYn/aqt2ZcRkFPjvUM6HJYXypZNhKOE3H1E=;
	b=L/BXIc2TRAqsBCJArx5QhoiGzhZ4idf1/p2ktcI+1llkqzlx1AilTsmx8BTfIfYiid
	9hwudb3Ya4IDSmkAVPJrzKjw9xGZOI6kkIzagsVeKH08l0zJQJgSQMnvY0DWdJgJeZh4
	8SuJxZpUMNmbAmFdiKI064uMTTyN/vDVSBSr2jnUqauyNG6zUmOBv/FYg48nQ7oXWbhf
	FPH/AFVl+u+ecyS2zPCpVnqxmzP1dGoRRGUP3Mm6+X2NUY+ITUvBT5DvG3fG0vY0eAOM
	9IsTZoTuBDRFnXHFQr8bJxCt/Tnux5iTVxFSDh94rlaYUrWsHd4o0fwEuVdyLXJ9a4dx
	sq6g==
X-Gm-Message-State: APjAAAWvqIul4nwdkCyzt/aJXO1RuKunA0pOVy2nuaBTQULpNXVzNA73
	aUKC9+6R1QjGYI+U8zkaZaCu+WvO3o++kg==
X-Google-Smtp-Source: APXvYqxdfGoJ3zQKfAekSI1xKH1yAH1nJAdq2mMehz804mTtSesrSQBNHMr19TjP3cCubARAC/wh3A==
X-Received: by 2002:adf:eacd:: with SMTP id o13mr3017975wrn.91.1561637846022; 
	Thu, 27 Jun 2019 05:17:26 -0700 (PDT)
Received: from [10.43.17.24] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id q1sm3920249wmq.25.2019.06.27.05.17.24
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jun 2019 05:17:25 -0700 (PDT)
To: Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20190619191048.20365-1-jaskarankhurana@linux.microsoft.com>
	<20190619191048.20365-2-jaskarankhurana@linux.microsoft.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <568f2532-e46b-5ac7-4fc5-c96983702f2d@gmail.com>
Date: Thu, 27 Jun 2019 14:17:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190619191048.20365-2-jaskarankhurana@linux.microsoft.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 27 Jun 2019 12:17:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Thu, 27 Jun 2019 12:17:27 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.109  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: scottsh@microsoft.com, snitzer@redhat.com, ebiggers@google.com,
	jmorris@namei.org, dm-devel@redhat.com, mpatocka@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH v5 1/1] Add dm verity root hash pkcs7 sig
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 27 Jun 2019 12:20:54 +0000 (UTC)

Hi,

I tried to test test the patch, two comments below.

On 19/06/2019 21:10, Jaskaran Khurana wrote:
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
> The hash is added as a key of type "user" and the description is passed to 
> the kernel so it can look it up and use it for verification.
> 
> Kernel commandline parameter will indicate whether to check (only if 
> specified) or force (for all dm verity volumes) roothash signature 
> verification.
> 
> Kernel commandline: dm_verity.verify_sig=1 or 2 for check/force root hash
> signature validation respectively.

1) I think the switch should be just boolean - enforce signatures for all dm-verity targets
(with default to false/off).

The rest should be handled by simple logic - if the root_hash_sig_key_desc option
is specified, the signature MUST be validated in the constructor, all errors should cause
failure (bad reference in keyring, bad signature, etc).

(Now it ignores for example bad reference to the keyring, this is quite misleading.)

If a user wants to activate a dm-verity device without a signature, just remove
optional argument referencing the signature.
(This is not possible with dm_verity.verify_sig set to true/on.)


2) All DM targets must provide the same mapping table status ("dmsetup table"
command) as initially configured.
The output of the command should be directly usable as mapping table constructor.

Your patch is missing that part, I tried to fix it, add-on patch is here
https://git.kernel.org/pub/scm/linux/kernel/git/mbroz/linux.git/commit/?h=dm-cryptsetup&id=a26c10806f5257e255b6a436713127e762935ad3
(feel free to fold it in your patch)


Thanks,
Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
