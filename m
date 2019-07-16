Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 445EC6A90A
	for <lists+dm-devel@lfdr.de>; Tue, 16 Jul 2019 14:59:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8AC493082B6D;
	Tue, 16 Jul 2019 12:59:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14FC45B684;
	Tue, 16 Jul 2019 12:59:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 268A81972D;
	Tue, 16 Jul 2019 12:59:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GCxLON019884 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 08:59:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AC1185E7AA; Tue, 16 Jul 2019 12:59:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15F615D9D6;
	Tue, 16 Jul 2019 12:59:17 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC90E3093382;
	Tue, 16 Jul 2019 12:59:15 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r1so20833231wrl.7;
	Tue, 16 Jul 2019 05:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=w9BxyRWmPBlvIeLtR87nRY5VKE+s5L3fJe5sGlRHZJM=;
	b=jrBp9R2lSvz8mzkqTX5FdlapNqw8F9d8ZpJXbN3mOzvIEKGOBn3NsI2DDna5+kvejb
	CqusQJuIfUj6WOqKeRbupdtCZAX6qig9Qv/m+Nf6wcYRWBlBA1EfMWW/l0EzRdsE91ry
	53k7IVXKUcMR0ketxsgIgOy/6WaBE8/9fBnRUa/HsqO1VRgt5gPRQtzMaLdBacqGNtAj
	8FTie2M3ITO0bTG1nlg5IIGkwnsobaOHKJpSWU9lAcxILoxxb42PVgzWMgWwzLc/vD5+
	hPzfxpCtlUw4mi8WMT8jIZTn6dQrIo3QJKpHDauhCQZIQmcRt2tUPYAojf20prF3Zfws
	b9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=w9BxyRWmPBlvIeLtR87nRY5VKE+s5L3fJe5sGlRHZJM=;
	b=eL6orXG7l83l3wcyMdpSjwt18eQYgJoTbnJeqJshavn06Tnoab2S/HesULDaUVaNU5
	fNN3ErdckMvGkqmcF79Pdbf32Twlg4Ev+obZHnwCo1Z5b0cZvckzdxf5N0xt/Fm23DTc
	XqtT5Eo2TWhqp8K7o+OLFmHjlIKh97UERthnIFHebJ7i0HKsV7LHCu6SCbvdkim9EVUB
	JcGDWK4mW0ne0fwIQQfvotxDRMWatsGFUNCL8Dx+y+G/BaM7Ht4vTkWeNPM/90v13azL
	HPnr5iJqoWPYPiXUoWW/Iu9bsGwLOYVopApxb9SVl9TIeuwipEbHLKcjR2Bpkfom7iW4
	+O5Q==
X-Gm-Message-State: APjAAAVbT5FtJlQ57hy/FCxFSa2F70EFVSXRHYireVHEoIlabXseC9EP
	YCC3EM9iWstkT4PEinIb5/+aQbbM
X-Google-Smtp-Source: APXvYqwUNedV7nyiAJsfAYj0IfYBVVW61M2i41mNTJJt8+IhH3UY5jgZgdgze/yJYLTpoxXKih7DTA==
X-Received: by 2002:a5d:6406:: with SMTP id z6mr35491318wru.280.1563281954206; 
	Tue, 16 Jul 2019 05:59:14 -0700 (PDT)
Received: from [10.43.17.52] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id
	g17sm14849574wrm.7.2019.07.16.05.59.12
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jul 2019 05:59:13 -0700 (PDT)
To: Jaskaran Singh Khurana <jaskarankhurana@linux.microsoft.com>
References: <20190701181958.6493-1-jaskarankhurana@linux.microsoft.com>
	<MN2PR21MB12008A962D4DD8662B3614508AF20@MN2PR21MB1200.namprd21.prod.outlook.com>
	<alpine.LRH.2.21.1907121025510.66082@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <395efa90-65d8-d832-3e2b-2b8ee3794688@gmail.com>
Date: Tue, 16 Jul 2019 14:59:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.1907121025510.66082@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 16 Jul 2019 12:59:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Tue, 16 Jul 2019 12:59:16 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Scott Shell <SCOTTSH@microsoft.com>, dm-devel@redhat.com,
	snitzer@redhat.com, ebiggers@google.com,
	Nazmus Sakib <mdsakib@microsoft.com>,
	linux-kernel@vger.kernel.org, jmorris@namei.org,
	linux-security-module@vger.kernel.org, mpatocka@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH v6 0/1] Add dm verity root hash pkcs7 sig
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 16 Jul 2019 12:59:52 +0000 (UTC)

On 12/07/2019 19:33, Jaskaran Singh Khurana wrote:
> 
> Hello Milan,
> 
>> Changes in v6:
>>
>> Address comments from Milan Broz and Eric Biggers on v5.
>>
>> -Keep the verification code under config DM_VERITY_VERIFY_ROOTHASH_SIG.
>>
>> -Change the command line parameter to requires_signatures(bool) which will
>> force root hash to be signed and trusted if specified.
>>
>> -Fix the signature not being present in verity_status. Merged the
>> https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fmbroz%2Flinux.git%2Fcommit%2F%3Fh%3Ddm-cryptsetup%26id%3Da26c10806f5257e255b6a436713127e762935ad3&amp;data=02%7C01%7CJaskaran.Khurana%40microsoft.com%7C18f92445e46940aeebb008d6fe50c610%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C636976020210890638&amp;sdata=aY0V9%2FBz2RHryIvoftGKUGnyPp9Fsc1JY4FZbHfW4hg%3D&amp;reserved=0
>> made by Milan Broz and tested it.
>>
>>
> 
> Could you please provide feedback on this v6 version.

Hi,

I am ok with the v6 patch; I think Mike will return to it in 5.4 reviews.

But the documentation is very brief. I spent quite a long time to configure the system properly.
I think you should add more description (at least to patch header) how to use this feature in combination with system keyring.

Do I understand correctly that these steps need to be done?

 - user configures a certificate and adds it in kernel builtin keyring (I used CONFIG_SYSTEM_TRUSTED_KEYS option).
 - the dm-verity device root hash is signed directly by a key of this cert
 - the signature is uploaded to the user keyring
 - reference to signature in keyring is added as an optional dm-verity table parameter root_hash_sig_key_desc
 - optionally, require_signatures dm-verity module is set to enforce signatures.

For reference, below is the bash script I used (with unpatched veritysetup to generate working DM table), is the expected workflow here?

#!/bin/bash

NAME=test
DEV=/dev/sdc
DEV_HASH=/dev/sdd
ROOT_HASH=778fccab393842688c9af89cfd0c5cde69377cbe21ed439109ec856f2aa8a423
SIGN=sign.txt
SIGN_NAME=verity:$NAME

# get unsigned device-mapper table using unpatched veritysetup
veritysetup open $DEV $NAME $DEV_HASH $ROOT_HASH
TABLE=$(dmsetup table $NAME)
veritysetup close $NAME

# Generate self-signed CA key, must be in .config as CONFIG_SYSTEM_TRUSTED_KEYS="path/ca.pem"
#openssl req -x509 -newkey rsa:1024 -keyout ca_key.pem -out ca.pem -nodes -days 365 -set_serial 01 -subj /CN=example.com

# sign root hash directly by CA cert
echo -n $ROOT_HASH | openssl smime -sign -nocerts -noattr -binary -inkey ca_key.pem -signer ca.pem -outform der -out $SIGN

# load signature to keyring
keyctl padd user $SIGN_NAME @u <$SIGN

# add device-mapper table, now with sighed root hash optional argument
dmsetup create -r $NAME --table "$TABLE 2 root_hash_sig_key_desc $SIGN_NAME"
dmsetup table $NAME

# cleanup
dmsetup remove $NAME
keyctl clear @u


Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
