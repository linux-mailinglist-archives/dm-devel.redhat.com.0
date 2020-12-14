Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E357F2D96C9
	for <lists+dm-devel@lfdr.de>; Mon, 14 Dec 2020 12:01:11 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-wr1pCF4-M9Gd5xg3Vf7ybg-1; Mon, 14 Dec 2020 06:01:08 -0500
X-MC-Unique: wr1pCF4-M9Gd5xg3Vf7ybg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9706D107464C;
	Mon, 14 Dec 2020 11:00:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 588C874459;
	Mon, 14 Dec 2020 11:00:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F33F05002C;
	Mon, 14 Dec 2020 11:00:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BC09rrQ000624 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Dec 2020 19:09:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C08492026D15; Sat, 12 Dec 2020 00:09:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC1592026D11
	for <dm-devel@redhat.com>; Sat, 12 Dec 2020 00:09:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6112C1010427
	for <dm-devel@redhat.com>; Sat, 12 Dec 2020 00:09:51 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-314-5PrzGrfvMlKu7EzFjQlGKw-1;
	Fri, 11 Dec 2020 19:09:48 -0500
X-MC-Unique: 5PrzGrfvMlKu7EzFjQlGKw-1
Received: from sequoia (162-237-133-238.lightspeed.rcsntx.sbcglobal.net
	[162.237.133.238])
	by linux.microsoft.com (Postfix) with ESMTPSA id DFF8720B717A;
	Fri, 11 Dec 2020 16:09:45 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DFF8720B717A
Date: Fri, 11 Dec 2020 18:09:44 -0600
From: Tyler Hicks <tyhicks@linux.microsoft.com>
To: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <20201212000944.GD4951@sequoia>
References: <20201211235807.30815-1-tusharsu@linux.microsoft.com>
	<20201211235807.30815-3-tusharsu@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <20201211235807.30815-3-tusharsu@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 14 Dec 2020 06:00:28 -0500
Cc: sashal@kernel.org, paul@paul-moore.com, snitzer@redhat.com,
	selinux@vger.kernel.org, stephen.smalley.work@gmail.com,
	jmorris@namei.org, zohar@linux.ibm.com,
	linux-kernel@vger.kernel.org, nramas@linux.microsoft.com,
	linux-security-module@vger.kernel.org, casey@schaufler-ca.com,
	linux-integrity@vger.kernel.org, dm-devel@redhat.com,
	gmazyland@gmail.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v8 2/8] IMA: add support to measure buffer
	data hash
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020-12-11 15:58:01, Tushar Sugandhi wrote:
> The original IMA buffer data measurement sizes were small (e.g. boot
> command line), but the new buffer data measurement use cases have data 
> sizes that are a lot larger.  Just as IMA measures the file data hash,
> not the file data, IMA should similarly support the option for measuring 
> the hash of the buffer data.
> 
> Measuring in-memory buffer-data/buffer-data-hash is different than
> measuring file-data/file-data-hash. For the file, IMA stores the
> measurements in both measurement log and the file's extended attribute -
> which can later be used for appraisal as well. For buffer, the
> measurements are only stored in the IMA log, since the buffer has no
> extended attributes associated with it.
> 
> Introduce a boolean parameter measure_buf_hash to support measuring
> hash of a buffer, which would be much smaller, instead of the buffer
> itself.
> 
> Signed-off-by: Tushar Sugandhi <tusharsu@linux.microsoft.com>

Reviewed-by: Tyler Hicks <tyhicks@linux.microsoft.com>

Tyler

> ---
>  security/integrity/ima/ima.h                 |  3 +-
>  security/integrity/ima/ima_appraise.c        |  2 +-
>  security/integrity/ima/ima_asymmetric_keys.c |  2 +-
>  security/integrity/ima/ima_main.c            | 38 +++++++++++++++++---
>  security/integrity/ima/ima_queue_keys.c      |  3 +-
>  5 files changed, 39 insertions(+), 9 deletions(-)
> 
> diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
> index e5622ce8cbb1..fa3044a7539f 100644
> --- a/security/integrity/ima/ima.h
> +++ b/security/integrity/ima/ima.h
> @@ -268,7 +268,8 @@ void ima_store_measurement(struct integrity_iint_cache *iint, struct file *file,
>  			   struct ima_template_desc *template_desc);
>  void process_buffer_measurement(struct inode *inode, const void *buf, int size,
>  				const char *eventname, enum ima_hooks func,
> -				int pcr, const char *func_data);
> +				int pcr, const char *func_data,
> +				bool measure_buf_hash);
>  void ima_audit_measurement(struct integrity_iint_cache *iint,
>  			   const unsigned char *filename);
>  int ima_alloc_init_template(struct ima_event_data *event_data,
> diff --git a/security/integrity/ima/ima_appraise.c b/security/integrity/ima/ima_appraise.c
> index 8361941ee0a1..46ffa38bab12 100644
> --- a/security/integrity/ima/ima_appraise.c
> +++ b/security/integrity/ima/ima_appraise.c
> @@ -352,7 +352,7 @@ int ima_check_blacklist(struct integrity_iint_cache *iint,
>  		if ((rc == -EPERM) && (iint->flags & IMA_MEASURE))
>  			process_buffer_measurement(NULL, digest, digestsize,
>  						   "blacklisted-hash", NONE,
> -						   pcr, NULL);
> +						   pcr, NULL, false);
>  	}
>  
>  	return rc;
> diff --git a/security/integrity/ima/ima_asymmetric_keys.c b/security/integrity/ima/ima_asymmetric_keys.c
> index 1c68c500c26f..a74095793936 100644
> --- a/security/integrity/ima/ima_asymmetric_keys.c
> +++ b/security/integrity/ima/ima_asymmetric_keys.c
> @@ -60,5 +60,5 @@ void ima_post_key_create_or_update(struct key *keyring, struct key *key,
>  	 */
>  	process_buffer_measurement(NULL, payload, payload_len,
>  				   keyring->description, KEY_CHECK, 0,
> -				   keyring->description);
> +				   keyring->description, false);
>  }
> diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
> index e76ef4bfd0f4..0f8409d77602 100644
> --- a/security/integrity/ima/ima_main.c
> +++ b/security/integrity/ima/ima_main.c
> @@ -779,7 +779,7 @@ int ima_post_load_data(char *buf, loff_t size,
>  }
>  
>  /*
> - * process_buffer_measurement - Measure the buffer to ima log.
> + * process_buffer_measurement - Measure the buffer or the buffer data hash
>   * @inode: inode associated with the object being measured (NULL for KEY_CHECK)
>   * @buf: pointer to the buffer that needs to be added to the log.
>   * @size: size of buffer(in bytes).
> @@ -787,12 +787,23 @@ int ima_post_load_data(char *buf, loff_t size,
>   * @func: IMA hook
>   * @pcr: pcr to extend the measurement
>   * @func_data: private data specific to @func, can be NULL.
> + * @measure_buf_hash: measure buffer hash
>   *
> - * Based on policy, the buffer is measured into the ima log.
> + * Measure the buffer into the IMA log, and extend the @pcr.
> + *
> + * Determine what buffers are allowed to be measured, based on the policy rules
> + * and the IMA hook passed using @func.
> + *
> + * Use @func_data, if provided, to match against the measurement policy rule
> + * data for @func.
> + *
> + * If @measure_buf_hash is set to true - measure hash of the buffer data,
> + * else measure the buffer data itself.
>   */
>  void process_buffer_measurement(struct inode *inode, const void *buf, int size,
>  				const char *eventname, enum ima_hooks func,
> -				int pcr, const char *func_data)
> +				int pcr, const char *func_data,
> +				bool measure_buf_hash)
>  {
>  	int ret = 0;
>  	const char *audit_cause = "ENOMEM";
> @@ -807,6 +818,8 @@ void process_buffer_measurement(struct inode *inode, const void *buf, int size,
>  		struct ima_digest_data hdr;
>  		char digest[IMA_MAX_DIGEST_SIZE];
>  	} hash = {};
> +	char buf_hash[IMA_MAX_DIGEST_SIZE];
> +	int buf_hash_len = hash_digest_size[ima_hash_algo];
>  	int violation = 0;
>  	int action = 0;
>  	u32 secid;
> @@ -849,13 +862,27 @@ void process_buffer_measurement(struct inode *inode, const void *buf, int size,
>  		goto out;
>  	}
>  
> +	if (measure_buf_hash) {
> +		memcpy(buf_hash, hash.hdr.digest, buf_hash_len);
> +
> +		ret = ima_calc_buffer_hash(buf_hash, buf_hash_len,
> +					   iint.ima_hash);
> +		if (ret < 0) {
> +			audit_cause = "measure_buf_hash_error";
> +			goto out;
> +		}
> +
> +		event_data.buf = buf_hash;
> +		event_data.buf_len = buf_hash_len;
> +	}
> +
>  	ret = ima_alloc_init_template(&event_data, &entry, template);
>  	if (ret < 0) {
>  		audit_cause = "alloc_entry";
>  		goto out;
>  	}
>  
> -	ret = ima_store_template(entry, violation, NULL, buf, pcr);
> +	ret = ima_store_template(entry, violation, NULL, event_data.buf, pcr);
>  	if (ret < 0) {
>  		audit_cause = "store_entry";
>  		ima_free_template_entry(entry);
> @@ -890,7 +917,8 @@ void ima_kexec_cmdline(int kernel_fd, const void *buf, int size)
>  		return;
>  
>  	process_buffer_measurement(file_inode(f.file), buf, size,
> -				   "kexec-cmdline", KEXEC_CMDLINE, 0, NULL);
> +				   "kexec-cmdline", KEXEC_CMDLINE, 0, NULL,
> +				   false);
>  	fdput(f);
>  }
>  
> diff --git a/security/integrity/ima/ima_queue_keys.c b/security/integrity/ima/ima_queue_keys.c
> index 69a8626a35c0..c2f2ad34f9b7 100644
> --- a/security/integrity/ima/ima_queue_keys.c
> +++ b/security/integrity/ima/ima_queue_keys.c
> @@ -162,7 +162,8 @@ void ima_process_queued_keys(void)
>  						   entry->payload_len,
>  						   entry->keyring_name,
>  						   KEY_CHECK, 0,
> -						   entry->keyring_name);
> +						   entry->keyring_name,
> +						   false);
>  		list_del(&entry->list);
>  		ima_free_key_entry(entry);
>  	}
> -- 
> 2.17.1
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

