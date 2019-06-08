Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6767339C04
	for <lists+dm-devel@lfdr.de>; Sat,  8 Jun 2019 11:12:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7D6A3091782;
	Sat,  8 Jun 2019 09:12:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 900045F9DB;
	Sat,  8 Jun 2019 09:12:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC4F01806B0E;
	Sat,  8 Jun 2019 09:12:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x589Bso3004452 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 8 Jun 2019 05:11:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B5FD9608CA; Sat,  8 Jun 2019 09:11:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 183CA608AB;
	Sat,  8 Jun 2019 09:11:50 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 723D888311;
	Sat,  8 Jun 2019 09:11:41 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b17so4364882wrq.11;
	Sat, 08 Jun 2019 02:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=wRhHOWXbYPTgd9o6E+fWzXVTSQiB2lqpeHlQbHdnv6Y=;
	b=NAh51xEAoqQZeJs899fcX2BxvuroPDabyTqyEP1cbLvkNk78j7SsajGCd2FUFEn9pE
	GM3mkiTpIKjG2T3ZT+3E62uOmuDX4EZqkCu6mD23vkTREk6ySK38jrG5WTgdHMPDJ33R
	B6kbcHA4yuEukkpSnPTqVS96bpiIsdQRCS2qdC0z9bqK5W21iptut7P+nRBKVsUokcD7
	E9oP67WbWFxHtXK7tPN16/D6C2FZR0LLBvPMHLI3mxmLlDBUMOto8bVP6KhGhqTwEsha
	N5xaek5vhguSPRmbj9JYGqDkyGj703l/H9TlNYaSOgagrw36dhx/MQ2YSYauSs71m3oJ
	HCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wRhHOWXbYPTgd9o6E+fWzXVTSQiB2lqpeHlQbHdnv6Y=;
	b=tfa6d5C5IZGnClCfCmUpijwGydq8q/3opEL38y/l7F/PmlhJ5pjg33qZJ2ePowrELF
	MA0S3x/BkYsVkf+JgUjex1Ly/eMSPm7SqXtpftfVuwRmUwk/ee3b/y+PpuzbBPvqRkTw
	J0p1GRgJq3yvV/4OPQtf8NfN2+6Nv7/s4Z19teWp+PcACze1mhAuhgGq9LmV51KHSOl0
	L6+cnCaQkhOT5LroLOfNwYeLvcBFTAzrSf+UEN7EpZ2KRGKK6WOTAlbEWtcpC/a1Psgy
	4nbwcy6BdS4Jvt78UDRDxsH9a6pYIRaKxAjVhZyMP/WCwzUYD4fLaPenoYAN3AYLe5wS
	3sPg==
X-Gm-Message-State: APjAAAVKr1ewQZf3CvLAaPRZ5eARSmV08hmdY35wx2XwF6k1DlYuBeFJ
	/0trmOy9X0H576WKdHB3KRctxrp2j8h7cw==
X-Google-Smtp-Source: APXvYqwM1/RGMYyTxmx2V0hdEZCN4VHYev4BVLwmFNnhFHp6W7idPt4B24+6it6AeMq4rfpflgd8Tg==
X-Received: by 2002:adf:bac5:: with SMTP id w5mr24577718wrg.124.1559985099809; 
	Sat, 08 Jun 2019 02:11:39 -0700 (PDT)
Received: from [192.168.8.100] (37-48-58-25.nat.epc.tmcz.cz. [37.48.58.25])
	by smtp.gmail.com with ESMTPSA id p3sm5258127wrd.47.2019.06.08.02.11.38
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Jun 2019 02:11:39 -0700 (PDT)
To: Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20190607223140.16979-1-jaskarankhurana@linux.microsoft.com>
	<20190607223140.16979-2-jaskarankhurana@linux.microsoft.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <54170d18-31c7-463d-10b5-9af8b666df0f@gmail.com>
Date: Sat, 8 Jun 2019 11:11:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607223140.16979-2-jaskarankhurana@linux.microsoft.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Sat, 08 Jun 2019 09:11:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Sat, 08 Jun 2019 09:11:41 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.773  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: scottsh@microsoft.com, snitzer@redhat.com, ebiggers@google.com,
	jmorris@namei.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH v3 1/1] Add dm verity root hash pkcs7 sig
	validation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Sat, 08 Jun 2019 09:12:25 +0000 (UTC)

On 08/06/2019 00:31, Jaskaran Khurana wrote:
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
> Adds DM_VERITY_VERIFY_ROOTHASH_SIG: roothash verification
> against the roothash signature file *if* specified, if signature file is
> specified verification must succeed prior to creation of device mapper
> block device.
> 
> Adds DM_VERITY_VERIFY_ROOTHASH_SIG_FORCE: roothash signature *must* be
> specified for all dm verity volumes and verification must succeed prior
> to creation of device mapper block device.

AFAIK there are tools that use dm-verity internally (some container
functions in systemd can recognize and check dm-verity partitions) and with
this option we will just kill possibility to use it without signature.

Anyway, this is up to Mike and Mikulas, I guess generic distros will not
set this option.

Some minor details below:

> diff --git a/drivers/md/Makefile b/drivers/md/Makefile
> index be7a6eb92abc..8a8c142bcfe1 100644
> --- a/drivers/md/Makefile
> +++ b/drivers/md/Makefile
> @@ -61,7 +61,7 @@ obj-$(CONFIG_DM_LOG_USERSPACE)	+= dm-log-userspace.o
>  obj-$(CONFIG_DM_ZERO)		+= dm-zero.o
>  obj-$(CONFIG_DM_RAID)	+= dm-raid.o
>  obj-$(CONFIG_DM_THIN_PROVISIONING)	+= dm-thin-pool.o
> -obj-$(CONFIG_DM_VERITY)		+= dm-verity.o
> +obj-$(CONFIG_DM_VERITY)		+= dm-verity.o dm-verity-verify-sig.o

Why is this different from existing FEC extension? 
FEC uses ifdefs in header to blind functions if config is not set.

ifeq ($(CONFIG_DM_VERITY_FEC),y)
dm-verity-objs                  += dm-verity-fec.o
endif

...

> diff --git a/drivers/md/dm-verity-verify-sig.c b/drivers/md/dm-verity-verify-sig.c
> new file mode 100644
> index 000000000000..1a889be76ede
> --- /dev/null
> +++ b/drivers/md/dm-verity-verify-sig.c

...

> +	key = request_key(&key_type_user,
> +			key_desc, NULL);
> +	if (IS_ERR(key))
> +		return PTR_ERR(key);

You will need dependence on keyring here (kernel can be configured without it),
try to compile it without CONFIG_KEYS selected.

I think it is ok that  DM_VERITY_VERIFY_ROOTHASH_SIG can directly require CONFIG_KEYS.
(Add depends on CONFIG_KEYS in KConfig)

Also please increase minor version of dm-verity target when adding functions, something like

@@ -1175,7 +1175,7 @@ static int verity_ctr(struct dm_target *ti, unsigned argc, char **argv)
 
 static struct target_type verity_target = {
        .name           = "verity",
-       .version        = {1, 4, 0},
+       .version        = {1, 5, 0},

Thanks,
Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
