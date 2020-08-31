Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9312577CD
	for <lists+dm-devel@lfdr.de>; Mon, 31 Aug 2020 12:56:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-CONP55x8PCmBvOubZlW5MA-1; Mon, 31 Aug 2020 06:56:05 -0400
X-MC-Unique: CONP55x8PCmBvOubZlW5MA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAB6318A2246;
	Mon, 31 Aug 2020 10:55:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26D481002D58;
	Mon, 31 Aug 2020 10:55:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2DB2D1826D29;
	Mon, 31 Aug 2020 10:55:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07VAsuCI008201 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 31 Aug 2020 06:54:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 625FF1004046; Mon, 31 Aug 2020 10:54:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D3B0111085E
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 10:54:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 185F187EF6C
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 10:54:54 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-111-FCZvVBATPua9bYd5IcMAmw-1; Mon, 31 Aug 2020 06:54:49 -0400
X-MC-Unique: FCZvVBATPua9bYd5IcMAmw-1
Received: by mail-wr1-f65.google.com with SMTP id a17so4608463wrn.6;
	Mon, 31 Aug 2020 03:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yaRd1ezQpeFZuNTb709vIWM/r8RbyFs2Etf58aEaNU4=;
	b=sK1fDBC9xIhsjdPvUW5/LocWZurqovikHDF60T4X4byFMCHWm8HxqtcnDrYLPEV8M9
	VgrVhEy46xhOPH3Da8fFtZYwmOVkjDjOw3necxCkiatKc+h3UCWK8TfmPZxkB0oaQ5SE
	g/GapZf8M5/VIwCRVy4n1YsXr5O6UAV59Wl9q1syg31PB3YYihV3YejvJdCa0rYKZwPv
	Br634I2eLdNBOgvHr9A4X4vVKtMvtMEYZx9b4ftw6acN+73TID+CoWiGmbT1asOmCN3k
	Ygq6hD54OFyB7p9XCrLD/n4UPNaO85ThRG5RNPqj1yccxDXq4ztqLtOIXzHuvscJ/8o0
	mgoQ==
X-Gm-Message-State: AOAM531j1Gt4p7wieu+nncZEqqvgWEoKOiaY2Kn++9od4e7DNy5LXIo9
	ymprykZASAGUQA5pKqwDKQkH63tlcvy+jw==
X-Google-Smtp-Source: ABdhPJw5z0yWDp2WlMF8EgkmUDXkB9pj7NGJdzA0QGtgPmJWn+m4QgqXWYddQTtF8BxmYgMGHwuNgA==
X-Received: by 2002:a5d:45c9:: with SMTP id b9mr1065898wrs.283.1598871288161; 
	Mon, 31 Aug 2020 03:54:48 -0700 (PDT)
Received: from [192.168.1.55] (cz11.datarail.eu. [151.249.104.38])
	by smtp.gmail.com with ESMTPSA id
	v204sm6680489wmg.20.2020.08.31.03.54.46
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 31 Aug 2020 03:54:47 -0700 (PDT)
To: Tushar Sugandhi <tusharsu@linux.microsoft.com>, zohar@linux.ibm.com,
	agk@redhat.com, snitzer@redhat.com, gmazyland@gmail.com
References: <20200828202700.23086-1-tusharsu@linux.microsoft.com>
	<20200828202700.23086-3-tusharsu@linux.microsoft.com>
From: Milan Broz <gmazyland@gmail.com>
Message-ID: <02daeaf7-aefc-448a-a6b3-ab22fe054224@gmail.com>
Date: Mon, 31 Aug 2020 12:54:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200828202700.23086-3-tusharsu@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: sashal@kernel.org, jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v3 2/2] dm-crypt: collect data and submit to
	DM to measure
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 28/08/2020 22:27, Tushar Sugandhi wrote:
> Currently, dm-crypt does not take advantage of IMA measuring
> capabilities, and ultimately the benefits of remote attestation.
> 
> Measure various dm-crypt constructs by calling various device-mapper
> functions - dm_ima_*() that use IMA measuring capabilities. Implement
> ima_measure_dm_crypt_data() to measure various dm-crypt constructs.
> 
> Ensure that ima_measure_dm_crypt_data() is non intrusive, i.e. failures
> in this function and the call-stack below should not affect the core
> functionality of dm-crypt.

Just my opinion, but I really do not like to add every relevant DM table option
as a harcoded value here. (But maybe it is necessary, dunno).

Why you cannot measure the whole device-mapper table as a string?
(output of STATUSTYPE_TABLE).
But it has own problems, like table can contain key etc.

Anyway with the above, the whole measurement can reside in DM core (I hope).

But there are some problems - we can activate device with optional flags
(for example allow_discards) - should this be IMA measurement?

And what about device size (you already measure offset)?

IMO it depends on situation (policy).

It is quite often that we add performance flags later (like these no_workqueue in 5.9).
Some of them should be measured because there is possible security/data integrity impact.

And one note - input table accepts also a device path, but output of table is always
major:minor, see:

# dmsetup create test --table "0 2097152 crypt aes-cbc-essiv:sha256 9c1185a5c5e9fc54612808977ee8f548b2258d31ddadef707ba62c166051b9e3 0 /dev/sdg 0"
# dmsetup table test --showkeys
0 2097152 crypt aes-cbc-essiv:sha256 9c1185a5c5e9fc54612808977ee8f548b2258d31ddadef707ba62c166051b9e3 0 8:96 0

I think dm_table_device_name() should work here (as you use it), but major number can change
on different activations (in general) later, isn't it problem here?
(Like dynamic major for DM devices that depends on module sequence load.)

Milan

> 
> Register dm-crypt as supported data source for IMA measurement in ima.h.
> 
> A demonstrative usage of above functionality on a system:
> 
> If the IMA policy contains the following rule:
> 
>     measure func=CRITICAL_DATA critical_kernel_data_sources=dm-crypt template=ima-buf
> 
> and, the following commands are used to setup a crypt target:
> 
>  #key="faf453b4ee938cff2f0d2c869a0b743f59125c0a37f5bcd8f1dbbd911a78abaa"
>  #arg="'0 1953125 crypt aes-xts-plain64 "
>  #arg="$arg $key 0 "
>  #arg="$arg /dev/loop0 0 1 allow_discards'"
>  #tgt_name="test-crypt"
>  #cmd="dmsetup create $tgt_name --table $arg"
>  #eval $cmd
> 
> then, the IMA log at
> /sys/kernel/security/integrity/ima/ascii_runtime_measurements should
> contain the dm-crypt measurements. And, the following IMA log entry
> should be added in the IMA log,
> 
>  ima-buf sha1:039d8ff71918608d585adca3e5aab2e3f41f84d6 
>  1598637500:520585536:dm-crypt:add_target 
>  74695f6e756d5f646973636172645f62696f733d313b7065725f62696f5f646
>  174615f73697a653d3834383b646d7265715f73746172743d3136383b74666d
>  735f636f756e743d313b6f6e5f6469736b5f7461675f73697a653d303b696e7
>  46567726974795f69765f73697a653d303b696e746567726974795f7461675f
>  73697a653d303b69765f73697a653d31363b69765f6f66667365743d303b736
>  563746f725f73686966743d303b736563746f725f73697a653d3531323b666c
>  6167733d323b6369706865725f666c6167733d303b73746172743d303b6b657
>  95f6d61635f73697a653d303b6b65795f65787472615f73697a653d303b6b65
>  795f70617274733d313b6b65795f73697a653d33323b6369706865725f73747
>  2696e673d6165732d7874732d706c61696e36343b6465766963655f6e616d65
>  3d3235333a303b
> 
> where, the ascii representation of the above data is:
> 
>  ti_num_discard_bios=1;per_bio_data_size=848;dmreq_start=168;
>  tfms_count=1;on_disk_tag_size=0;integrity_iv_size=0;
>  integrity_tag_size=0;iv_size=16;iv_offset=0;sector_shift=0;
>  sector_size=512;flags=2;cipher_flags=0;start=0;key_mac_size=0;
>  key_extra_size=0;key_parts=1;key_size=32;
>  cipher_string=aes-xts-plain64;device_name=253:0;
> 
> Some of the above values can be verified using:
> 
>  #dmsetup table --showkeys
> 
> where, the output of the command should be similar to:
> 
>  test-crypt: 0 1953125 crypt aes-xts-plain64
>  faf453b4ee938cff2f0d2c869a0b743f59125c0a37f5bcd8f1dbbd911a78abaa
>  0 7:0 0 1 allow_discards
> 
> Signed-off-by: Tushar Sugandhi <tusharsu@linux.microsoft.com>
> ---
>  drivers/md/dm-crypt.c          | 171 +++++++++++++++++++++++++++++++++
>  security/integrity/ima/Kconfig |   3 +-
>  security/integrity/ima/ima.h   |   1 +
>  3 files changed, 173 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index 148960721254..47fb2ce15211 100644
> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c
> @@ -2529,6 +2529,8 @@ static void crypt_dtr(struct dm_target *ti)
>  
>  	ti->private = NULL;
>  
> +	dm_ima_exit_measurements(ti->type);
> +
>  	if (!cc)
>  		return;
>  
> @@ -2991,6 +2993,167 @@ static int crypt_report_zones(struct dm_target *ti,
>  
>  #endif
>  
> +#ifdef CONFIG_IMA
> +/*
> + * append integer values to dm-crypt specific data
> + * to be measured through IMA
> + */
> +static int ima_append_num_values(struct dm_target *ti,
> +				 const char *key,
> +				 long long num_val)
> +{
> +	char *num_str = NULL;
> +	int length = 0;
> +	int r = 0;
> +
> +	if (!ti || !key) {
> +		r = -EINVAL;
> +		goto error;
> +	}
> +
> +	length = snprintf(NULL, 0, "%lld", num_val);
> +	num_str = kzalloc(length + 1, GFP_KERNEL);
> +	if (!num_str) {
> +		r = -ENOMEM;
> +		goto error;
> +	}
> +	snprintf(num_str, length + 1, "%lld", num_val);
> +	dm_ima_append_measurement_list(ti->type,
> +				       key,
> +				       (const void *)num_str,
> +				       length);
> +	kzfree(num_str);
> +	return r;
> +error:
> +	DMERR("appending num values to IMA measurement list failed %d", r);
> +	return r;
> +}
> +/*
> + * Measure dm-crypt specific data through IMA.
> + * It appends all the needed data to the list as a key-val pair using
> + * dm_ima_append_measurement_list() and internal ima_append_num_values(),
> + * and finally measures the list using dm_ima_finalize_and_measure().
> + */
> +static void ima_measure_dm_crypt_data(struct dm_target *ti, const char *desc)
> +{
> +	int r = 0;
> +	struct crypt_config *cc = NULL;
> +	const char *devname = dm_table_device_name(ti->table);
> +
> +	if (!ti) {
> +		r = -EINVAL;
> +		goto out;
> +	}
> +
> +	cc = ti->private;
> +
> +	if (devname) {
> +		dm_ima_append_measurement_list(ti->type,
> +					       "device_name",
> +					       (const void *)devname,
> +					       strlen(devname));
> +	}
> +
> +	if (cc->cipher_string) {
> +		dm_ima_append_measurement_list(ti->type,
> +					       "cipher_string",
> +					       (const void *)cc->cipher_string,
> +					       strlen(cc->cipher_string));
> +	}
> +
> +	if (cc->cipher_auth) {
> +		dm_ima_append_measurement_list(ti->type,
> +					       "cipher_auth",
> +					       (const void *)cc->cipher_auth,
> +					       strlen(cc->cipher_auth));
> +	}
> +
> +	r = ima_append_num_values(ti, "key_size", cc->key_size);
> +	if (r)
> +		goto out;
> +
> +	r = ima_append_num_values(ti, "key_parts", cc->key_parts);
> +	if (r)
> +		goto out;
> +
> +	r = ima_append_num_values(ti, "key_extra_size", cc->key_extra_size);
> +	if (r)
> +		goto out;
> +
> +	r = ima_append_num_values(ti, "key_mac_size", cc->key_mac_size);
> +	if (r)
> +		goto out;
> +
> +	r = ima_append_num_values(ti, "start", cc->start);
> +	if (r)
> +		goto out;
> +
> +	r = ima_append_num_values(ti, "cipher_flags", cc->cipher_flags);
> +	if (r)
> +		goto out;
> +
> +	r = ima_append_num_values(ti, "flags", cc->flags);
> +	if (r)
> +		goto out;
> +
> +	r = ima_append_num_values(ti, "sector_size", cc->sector_size);
> +	if (r)
> +		goto out;
> +
> +	r = ima_append_num_values(ti, "sector_shift", cc->sector_shift);
> +	if (r)
> +		goto out;
> +
> +	r = ima_append_num_values(ti, "iv_offset", cc->iv_offset);
> +	if (r)
> +		goto out;
> +
> +	r = ima_append_num_values(ti, "iv_size", cc->iv_size);
> +	if (r)
> +		goto out;
> +
> +	r = ima_append_num_values(ti, "integrity_tag_size", cc->integrity_tag_size);
> +	if (r)
> +		goto out;
> +
> +	r = ima_append_num_values(ti, "integrity_iv_size", cc->integrity_iv_size);
> +	if (r)
> +		goto out;
> +
> +	r = ima_append_num_values(ti, "on_disk_tag_size", cc->on_disk_tag_size);
> +	if (r)
> +		goto out;
> +
> +	r = ima_append_num_values(ti, "tfms_count", cc->tfms_count);
> +	if (r)
> +		goto out;
> +
> +	r = ima_append_num_values(ti, "dmreq_start", cc->dmreq_start);
> +	if (r)
> +		goto out;
> +
> +	r = ima_append_num_values(ti, "per_bio_data_size", cc->per_bio_data_size);
> +	if (r)
> +		goto out;
> +
> +	r = ima_append_num_values(ti, "ti_num_discard_bios",
> +			      ti->num_discard_bios);
> +	if (r)
> +		goto out;
> +
> +	dm_ima_finalize_and_measure(ti->type, desc, false);
> +	return;
> +
> +out:
> +	DMERR("IMA measurement of dm-crypt data failed %d", r);
> +
> +}
> +#else
> +static inline void ima_measure_dm_crypt_data(struct dm_target *ti,
> +					     const char *desc) {}
> +#endif /* CONFIG_IMA */
> +
> +
>  /*
>   * Construct an encryption mapping:
>   * <cipher> [<key>|:<key_size>:<user|logon>:<key_description>] <iv_offset> <dev_path> <start>
> @@ -3186,6 +3349,10 @@ static int crypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  
>  	ti->num_flush_bios = 1;
>  
> +	dm_ima_init_measurements(ti->type);
> +
> +	ima_measure_dm_crypt_data(ti, "add_target");
> +
>  	return 0;
>  
>  bad:
> @@ -3324,6 +3491,8 @@ static void crypt_postsuspend(struct dm_target *ti)
>  	struct crypt_config *cc = ti->private;
>  
>  	set_bit(DM_CRYPT_SUSPENDED, &cc->flags);
> +
> +	ima_measure_dm_crypt_data(ti, "post_suspend");
>  }
>  
>  static int crypt_preresume(struct dm_target *ti)
> @@ -3343,6 +3512,8 @@ static void crypt_resume(struct dm_target *ti)
>  	struct crypt_config *cc = ti->private;
>  
>  	clear_bit(DM_CRYPT_SUSPENDED, &cc->flags);
> +
> +	ima_measure_dm_crypt_data(ti, "resume");
>  }
>  
>  /* Message interface
> diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
> index 953314d145bb..ad643cc5aad4 100644
> --- a/security/integrity/ima/Kconfig
> +++ b/security/integrity/ima/Kconfig
> @@ -324,8 +324,7 @@ config IMA_MEASURE_ASYMMETRIC_KEYS
>  
>  config IMA_QUEUE_EARLY_BOOT_DATA
>  	bool
> -	depends on IMA_MEASURE_ASYMMETRIC_KEYS
> -	depends on SYSTEM_TRUSTED_KEYRING
> +        depends on (IMA_MEASURE_ASYMMETRIC_KEYS && SYSTEM_TRUSTED_KEYRING) || DM_CRYPT
>  	default y
>  
>  config IMA_SECURE_AND_OR_TRUSTED_BOOT
> diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
> index 422fe833037d..bc922aa2ff92 100644
> --- a/security/integrity/ima/ima.h
> +++ b/security/integrity/ima/ima.h
> @@ -230,6 +230,7 @@ struct modsig;
>  
>  #define __ima_supported_kernel_data_sources(source)	\
>  	source(MIN_SOURCE, min_source)			\
> +	source(DM_CRYPT, dm-crypt)			\
>  	source(MAX_SOURCE, max_source)
>  
>  #define __ima_enum_stringify(ENUM, str) (#str),
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

