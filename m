Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 91B80222D97
	for <lists+dm-devel@lfdr.de>; Thu, 16 Jul 2020 23:18:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594934296;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4rSLcFHl7N6S4uxRuBR3FJvGydWV8oOldIpdAQ3FRco=;
	b=Py9d0fgQLb+3P0zc2YV1bh0sVhal44xVpcmgrRdPIQncs6EKIVOSouW2lZaEG/d/4p0GMl
	QRChc39HOyMI6gVfIAISAVSHQbC6hHULVazthOmNmI5/0ZUCQnYm+9SRMc/M/XzPKpQGSJ
	e6mBm+j22/ZGYdgFf1pXpD8pXpQxkF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-sbOW11zoNdihAxtDNkv1Yw-1; Thu, 16 Jul 2020 17:18:13 -0400
X-MC-Unique: sbOW11zoNdihAxtDNkv1Yw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03EFD8005B0;
	Thu, 16 Jul 2020 21:18:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 657B572AC8;
	Thu, 16 Jul 2020 21:17:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 578BC96227;
	Thu, 16 Jul 2020 21:17:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06GLHDWG015982 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Jul 2020 17:17:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ACD1919D7B; Thu, 16 Jul 2020 21:17:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B00DC19C58;
	Thu, 16 Jul 2020 21:17:10 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06GLH901023121; 
	Thu, 16 Jul 2020 16:17:09 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06GLH8O0023120;
	Thu, 16 Jul 2020 16:17:08 -0500
Date: Thu, 16 Jul 2020 16:17:08 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200716211708.GM11089@octiron.msp.redhat.com>
References: <20200709101620.6786-1-mwilck@suse.com>
	<20200709101620.6786-9-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200709101620.6786-9-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 08/35] libmultipath: create bitfield
	abstraction
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 09, 2020 at 12:15:53PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> In e32d521d ("libmultipath: coalesce_paths: fix size mismatch handling"),
> we introduced simple bitmap handling functions. We can do better. This
> patch introduces a bitfield type with overflow detection and a
> find_first_set() method.
> 
> Use this in coalesce_paths(), and adapt the unit tests. Also, add
> unit tests for "odd" bitfield sizes; so far we tested only multiples
> of 64.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/configure.c |   9 +-
>  libmultipath/util.c      |  35 ++++++
>  libmultipath/util.h      |  57 ++++++++-
>  tests/util.c             | 263 +++++++++++++++++++++++++++++++++++----
>  4 files changed, 327 insertions(+), 37 deletions(-)
> 
> diff --git a/libmultipath/configure.c b/libmultipath/configure.c
> index 96c7961..fe590f4 100644
> --- a/libmultipath/configure.c
> +++ b/libmultipath/configure.c
> @@ -1092,7 +1092,7 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
>  	vector pathvec = vecs->pathvec;
>  	struct config *conf;
>  	int allow_queueing;
> -	uint64_t *size_mismatch_seen;
> +	struct bitfield *size_mismatch_seen;
>  
>  	/* ignore refwwid if it's empty */
>  	if (refwwid && !strlen(refwwid))
> @@ -1106,8 +1106,7 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
>  
>  	if (VECTOR_SIZE(pathvec) == 0)
>  		return CP_OK;
> -	size_mismatch_seen = calloc((VECTOR_SIZE(pathvec) - 1) / 64 + 1,
> -				    sizeof(uint64_t));
> +	size_mismatch_seen = alloc_bitfield(VECTOR_SIZE(pathvec));
>  	if (size_mismatch_seen == NULL)
>  		return CP_FAIL;
>  
> @@ -1131,7 +1130,7 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
>  		}
>  
>  		/* 2. if path already coalesced, or seen and discarded */
> -		if (pp1->mpp || is_bit_set_in_array(k, size_mismatch_seen))
> +		if (pp1->mpp || is_bit_set_in_bitfield(k, size_mismatch_seen))
>  			continue;
>  
>  		/* 3. if path has disappeared */
> @@ -1183,7 +1182,7 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
>  					"Discard", pp2->dev, pp2->size,
>  					mpp->size);
>  				mpp->action = ACT_REJECT;
> -				set_bit_in_array(i, size_mismatch_seen);
> +				set_bit_in_bitfield(i, size_mismatch_seen);
>  			}
>  		}
>  		verify_paths(mpp, vecs);
> diff --git a/libmultipath/util.c b/libmultipath/util.c
> index 3c43f28..46cacd4 100644
> --- a/libmultipath/util.c
> +++ b/libmultipath/util.c
> @@ -404,3 +404,38 @@ void close_fd(void *arg)
>  {
>  	close((long)arg);
>  }
> +
> +struct bitfield *alloc_bitfield(unsigned int maxbit)
> +{
> +	unsigned int n;
> +	struct bitfield *bf;
> +
> +	n = maxbit > 0 ? (maxbit - 1) / bits_per_slot + 1 : 0;

What's the point in accepting 0? That's an empty bitmap.

> +	bf = calloc(1, sizeof(struct bitfield) + n * sizeof(bitfield_t));

Need to check that bf got set before dereferencing it.

> +	bf->len = maxbit;
> +	return bf;
> +}
> +
> +void _log_bitfield_overflow(const char *f, unsigned int bit, unsigned int len)
> +{
> +	condlog(0, "%s: bitfield overflow: %u >= %u", f, bit, len);
> +}
> +
> +unsigned int find_first_set(const struct bitfield *bf)
> +{
> +	unsigned int b = 0, i, n;
> +
> +	for (i = 0; i < bf->len; i+= bits_per_slot) {
> +		b = _ffs(bf->bits[i / bits_per_slot]);
> +		if (b != 0)
> +			break;
> +	};
> +	if (b == 0)
> +		return 0;
> +
> +	n = i + b;
> +	if (n <= bf->len)
> +		return n;
> +
> +	return 0;
> +}

This is neat and all, but what's it for?  I didn't see it used in the
rest of the patches.  Did I miss it, or do you have a future use for it?

> diff --git a/libmultipath/util.h b/libmultipath/util.h
> index df75c4f..ec6de6d 100644
> --- a/libmultipath/util.h
> +++ b/libmultipath/util.h
> @@ -1,6 +1,9 @@
>  #ifndef _UTIL_H
>  #define _UTIL_H
>  
> +#include <stdlib.h>
> +#include <string.h>
> +#include <limits.h>
>  #include <sys/types.h>
>  /* for rlim_t */
>  #include <sys/resource.h>
> @@ -51,19 +54,61 @@ struct scandir_result {
>  };
>  void free_scandir_result(struct scandir_result *);
>  
> -static inline bool is_bit_set_in_array(unsigned int bit, const uint64_t *arr)
> +/*
> + * ffsll() is also available on glibc < 2.27 if _GNU_SOURCE is defined.
> + * But relying on that would require that every program using this header file
> + * set _GNU_SOURCE during compilation, because otherwise the library and the
> + * program would use different types for bitfield_t, causing errors.
> + * That's too error prone, so if in doubt, use ffs().
> + */
> +#if __GLIBC_PREREQ(2, 27)
> +typedef unsigned long long int bitfield_t;
> +#define _ffs(x) ffsll(x)
> +#else
> +typedef unsigned int bitfield_t;
> +#define _ffs(x) ffs(x)
> +#endif
> +#define bits_per_slot (sizeof(bitfield_t) * CHAR_BIT)
> +
> +struct bitfield {
> +	unsigned int len;
> +	bitfield_t bits[];
> +};
> +
> +struct bitfield *alloc_bitfield(unsigned int maxbit);
> +
> +void _log_bitfield_overflow(const char *f, unsigned int bit, unsigned int len);
> +#define log_bitfield_overflow(bit, len) \
> +	_log_bitfield_overflow(__func__, bit, len)
> +
> +static inline bool is_bit_set_in_bitfield(unsigned int bit,
> +				       const struct bitfield *bf)
>  {
> -	return arr[bit / 64] & (1ULL << (bit % 64)) ? 1 : 0;
> +	if (bit >= bf->len) {
> +		log_bitfield_overflow(bit, bf->len);
> +		return false;
> +	}
> +	return !!(bf->bits[bit / bits_per_slot] &
> +		  (1ULL << (bit % bits_per_slot)));
>  }
>  
> -static inline void set_bit_in_array(unsigned int bit, uint64_t *arr)
> +static inline void set_bit_in_bitfield(unsigned int bit, struct bitfield *bf)
>  {
> -	arr[bit / 64] |= (1ULL << (bit % 64));
> +	if (bit >= bf->len) {
> +		log_bitfield_overflow(bit, bf->len);
> +		return;
> +	}
> +	bf->bits[bit / bits_per_slot] |= (1ULL << (bit % bits_per_slot));
>  }
>  
> -static inline void clear_bit_in_array(unsigned int bit, uint64_t *arr)
> +static inline void clear_bit_in_bitfield(unsigned int bit, struct bitfield *bf)
>  {
> -	arr[bit / 64] &= ~(1ULL << (bit % 64));
> +	if (bit >= bf->len) {
> +		log_bitfield_overflow(bit, bf->len);
> +		return;
> +	}
> +	bf->bits[bit / bits_per_slot] &= ~(1ULL << (bit % bits_per_slot));
>  }
>  
> +unsigned int find_first_set(const struct bitfield *bf);
>  #endif /* _UTIL_H */
> diff --git a/tests/util.c b/tests/util.c
> index 6d12fda..db7c05f 100644
> --- a/tests/util.c
> +++ b/tests/util.c
> @@ -164,19 +164,25 @@ static int test_basenamecpy(void)
>  
>  static void test_bitmask_1(void **state)
>  {
> -	uint64_t arr[BITARR_SZ];
> +	struct bitfield *bf;
> +	uint64_t *arr;
>  	int i, j, k, m, b;
>  
> -	memset(arr, 0, sizeof(arr));
> +	bf = alloc_bitfield(BITARR_SZ * 64);
> +	assert_non_null(bf);
> +	assert_int_equal(bf->len, BITARR_SZ * 64);
> +	arr = (uint64_t *)bf->bits;
>  
>  	for (j = 0; j < BITARR_SZ; j++) {
>  		for (i = 0; i < 64; i++) {
>  			b = 64 * j + i;
> -			assert(!is_bit_set_in_array(b, arr));
> -			set_bit_in_array(b, arr);
> +			assert(!is_bit_set_in_bitfield(b, bf));
> +			set_bit_in_bitfield(b, bf);
>  			for (k = 0; k < BITARR_SZ; k++) {
> +#if 0
>  				printf("b = %d j = %d k = %d a = %"PRIx64"\n",
>  				       b, j, k, arr[k]);
> +#endif
>  				if (k == j)
>  					assert_int_equal(arr[j], 1ULL << i);
>  				else
> @@ -184,39 +190,46 @@ static void test_bitmask_1(void **state)
>  			}
>  			for (m = 0; m < 64; m++)
>  				if (i == m)
> -					assert(is_bit_set_in_array(64 * j + m,
> -								   arr));
> +					assert(is_bit_set_in_bitfield(64 * j + m,
> +								      bf));
>  				else
> -					assert(!is_bit_set_in_array(64 * j + m,
> -								    arr));
> -			clear_bit_in_array(b, arr);
> -			assert(!is_bit_set_in_array(b, arr));
> +					assert(!is_bit_set_in_bitfield(64 * j + m,
> +								       bf));
> +			assert_int_equal(find_first_set(bf), b + 1);
> +			clear_bit_in_bitfield(b, bf);
> +			assert(!is_bit_set_in_bitfield(b, bf));
>  			for (k = 0; k < BITARR_SZ; k++)
>  				assert_int_equal(arr[k], 0ULL);
>  		}
>  	}
> +	free(bf);
>  }
>  
>  static void test_bitmask_2(void **state)
>  {
> -	uint64_t arr[BITARR_SZ];
> +	struct bitfield *bf;
> +	uint64_t *arr;
>  	int i, j, k, m, b;
>  
> -	memset(arr, 0, sizeof(arr));
> +	bf = alloc_bitfield(BITARR_SZ * 64);
> +	assert_non_null(bf);
> +	assert_int_equal(bf->len, BITARR_SZ * 64);
> +	arr = (uint64_t *)bf->bits;
>  
>  	for (j = 0; j < BITARR_SZ; j++) {
>  		for (i = 0; i < 64; i++) {
>  			b = 64 * j + i;
> -			assert(!is_bit_set_in_array(b, arr));
> -			set_bit_in_array(b, arr);
> +			assert(!is_bit_set_in_bitfield(b, bf));
> +			set_bit_in_bitfield(b, bf);
>  			for (m = 0; m < 64; m++)
>  				if (m <= i)
> -					assert(is_bit_set_in_array(64 * j + m,
> -								   arr));
> +					assert(is_bit_set_in_bitfield(64 * j + m,
> +								      bf));
>  				else
> -					assert(!is_bit_set_in_array(64 * j + m,
> -								    arr));
> -			assert(is_bit_set_in_array(b, arr));
> +					assert(!is_bit_set_in_bitfield(64 * j + m,
> +								       bf));
> +			assert(is_bit_set_in_bitfield(b, bf));
> +			assert_int_equal(find_first_set(bf), 1);
>  			for (k = 0; k < BITARR_SZ; k++) {
>  				if (k < j || (k == j && i == 63))
>  					assert_int_equal(arr[k], ~0ULL);
> @@ -232,16 +245,20 @@ static void test_bitmask_2(void **state)
>  	for (j = 0; j < BITARR_SZ; j++) {
>  		for (i = 0; i < 64; i++) {
>  			b = 64 * j + i;
> -			assert(is_bit_set_in_array(b, arr));
> -			clear_bit_in_array(b, arr);
> +			assert(is_bit_set_in_bitfield(b, bf));
> +			clear_bit_in_bitfield(b, bf);
>  			for (m = 0; m < 64; m++)
>  				if (m <= i)
> -					assert(!is_bit_set_in_array(64 * j + m,
> -								    arr));
> +					assert(!is_bit_set_in_bitfield(64 * j + m,
> +								       bf));
>  				else
> -					assert(is_bit_set_in_array(64 * j + m,
> -								   arr));
> -			assert(!is_bit_set_in_array(b, arr));
> +					assert(is_bit_set_in_bitfield(64 * j + m,
> +								      bf));
> +			assert(!is_bit_set_in_bitfield(b, bf));
> +			if (b == 64 * BITARR_SZ - 1)
> +				assert_int_equal(find_first_set(bf), 0);
> +			else
> +				assert_int_equal(find_first_set(bf), b + 2);
>  			for (k = 0; k < BITARR_SZ; k++) {
>  				if (k < j || (k == j && i == 63))
>  					assert_int_equal(arr[k], 0ULL);
> @@ -254,13 +271,207 @@ static void test_bitmask_2(void **state)
>  			}
>  		}
>  	}
> +	free(bf);
>  }
>  
> +/*
> + *  Test operations on a 0-length bitfield
> + */
> +static void test_bitmask_len_0(void **state)
> +{
> +	struct bitfield *bf;
> +
> +	bf = alloc_bitfield(0);
> +	assert_non_null(bf);
> +	assert_int_equal(bf->len, 0);
> +	assert_int_equal(is_bit_set_in_bitfield(0, bf), 0);
> +	assert_int_equal(is_bit_set_in_bitfield(1, bf), 0);
> +	assert_int_equal(find_first_set(bf), 0);
> +	set_bit_in_bitfield(0, bf);
> +	assert_int_equal(is_bit_set_in_bitfield(0, bf), 0);
> +	assert_int_equal(find_first_set(bf), 0);
> +	clear_bit_in_bitfield(0, bf);
> +	assert_int_equal(is_bit_set_in_bitfield(0, bf), 0);
> +	set_bit_in_bitfield(11, bf);
> +	assert_int_equal(find_first_set(bf), 0);
> +	assert_int_equal(is_bit_set_in_bitfield(11, bf), 0);
> +	clear_bit_in_bitfield(11, bf);
> +	assert_int_equal(is_bit_set_in_bitfield(11, bf), 0);
> +	free(bf);
> +}
> +
> +static void _test_bitmask_small(unsigned int n)
> +{
> +	struct bitfield *bf;
> +	uint64_t *arr;
> +
> +	assert(n <= 64);
> +	assert(n >= 1);
> +
> +	bf = alloc_bitfield(n);
> +	assert_non_null(bf);
> +	assert_int_equal(bf->len, n);
> +	arr = (uint64_t *)bf->bits;
> +
> +	assert_int_equal(*arr, 0);
> +
> +	set_bit_in_bitfield(n + 1, bf);
> +	assert_int_equal(*arr, 0);
> +	assert_int_equal(find_first_set(bf), 0);
> +
> +	set_bit_in_bitfield(n, bf);
> +	assert_int_equal(*arr, 0);
> +	assert_int_equal(find_first_set(bf), 0);
> +
> +	set_bit_in_bitfield(n - 1, bf);
> +	assert_int_equal(*arr, 1ULL << (n - 1));
> +	assert_int_equal(find_first_set(bf), n);
> +
> +	clear_bit_in_bitfield(n - 1, bf);
> +	assert_int_equal(*arr, 0);
> +	assert_int_equal(find_first_set(bf), 0);
> +
> +	set_bit_in_bitfield(0, bf);
> +	assert_int_equal(*arr, 1);
> +	assert_int_equal(find_first_set(bf), 1);
> +
> +	free(bf);
> +}
> +
> +static void _test_bitmask_small_2(unsigned int n)
> +{
> +	struct bitfield *bf;
> +	uint64_t *arr;
> +
> +	assert(n <= 128);
> +	assert(n >= 65);
> +
> +	bf = alloc_bitfield(n);
> +	assert_non_null(bf);
> +	assert_int_equal(bf->len, n);
> +	arr = (uint64_t *)bf->bits;
> +
> +	assert_int_equal(arr[0], 0);
> +	assert_int_equal(arr[1], 0);
> +
> +	set_bit_in_bitfield(n + 1, bf);
> +	assert_int_equal(arr[0], 0);
> +	assert_int_equal(arr[1], 0);
> +	assert_int_equal(find_first_set(bf), 0);
> +
> +	set_bit_in_bitfield(n, bf);
> +	assert_int_equal(arr[0], 0);
> +	assert_int_equal(arr[1], 0);
> +	assert_int_equal(find_first_set(bf), 0);
> +
> +	set_bit_in_bitfield(n - 1, bf);
> +	assert_int_equal(arr[0], 0);
> +	assert_int_equal(arr[1], 1ULL << (n - 65));
> +	assert_int_equal(find_first_set(bf), n);
> +
> +	set_bit_in_bitfield(0, bf);
> +	assert_int_equal(arr[0], 1);
> +	assert_int_equal(arr[1], 1ULL << (n - 65));
> +	assert_int_equal(find_first_set(bf), 1);
> +
> +	set_bit_in_bitfield(64, bf);
> +	assert_int_equal(arr[0], 1);
> +	assert_int_equal(arr[1], (1ULL << (n - 65)) | 1);
> +	assert_int_equal(find_first_set(bf), 1);
> +
> +	clear_bit_in_bitfield(0, bf);
> +	assert_int_equal(arr[0], 0);
> +	assert_int_equal(arr[1], (1ULL << (n - 65)) | 1);
> +	assert_int_equal(find_first_set(bf), 65);
> +
> +	free(bf);
> +}
> +
> +static void test_bitmask_len_1(void **state)
> +{
> +	_test_bitmask_small(1);
> +}
> +
> +static void test_bitmask_len_2(void **state)
> +{
> +	_test_bitmask_small(2);
> +}
> +
> +static void test_bitmask_len_3(void **state)
> +{
> +	_test_bitmask_small(3);
> +}
> +
> +static void test_bitmask_len_23(void **state)
> +{
> +	_test_bitmask_small(23);
> +}
> +
> +static void test_bitmask_len_63(void **state)
> +{
> +	_test_bitmask_small(63);
> +}
> +
> +static void test_bitmask_len_64(void **state)
> +{
> +	_test_bitmask_small(63);
> +}
> +
> +static void test_bitmask_len_65(void **state)
> +{
> +	_test_bitmask_small_2(65);
> +}
> +
> +static void test_bitmask_len_66(void **state)
> +{
> +	_test_bitmask_small_2(66);
> +}
> +
> +static void test_bitmask_len_67(void **state)
> +{
> +	_test_bitmask_small_2(67);
> +}
> +
> +static void test_bitmask_len_103(void **state)
> +{
> +	_test_bitmask_small_2(103);
> +}
> +
> +static void test_bitmask_len_126(void **state)
> +{
> +	_test_bitmask_small_2(126);
> +}
> +
> +static void test_bitmask_len_127(void **state)
> +{
> +	_test_bitmask_small_2(127);
> +}
> +
> +static void test_bitmask_len_128(void **state)
> +{
> +	_test_bitmask_small_2(128);
> +}
> +
> +
>  static int test_bitmasks(void)
>  {
>  	const struct CMUnitTest tests[] = {
>  		cmocka_unit_test(test_bitmask_1),
>  		cmocka_unit_test(test_bitmask_2),
> +		cmocka_unit_test(test_bitmask_len_0),
> +		cmocka_unit_test(test_bitmask_len_1),
> +		cmocka_unit_test(test_bitmask_len_2),
> +		cmocka_unit_test(test_bitmask_len_3),
> +		cmocka_unit_test(test_bitmask_len_23),
> +		cmocka_unit_test(test_bitmask_len_63),
> +		cmocka_unit_test(test_bitmask_len_64),
> +		cmocka_unit_test(test_bitmask_len_65),
> +		cmocka_unit_test(test_bitmask_len_66),
> +		cmocka_unit_test(test_bitmask_len_67),
> +		cmocka_unit_test(test_bitmask_len_103),
> +		cmocka_unit_test(test_bitmask_len_126),
> +		cmocka_unit_test(test_bitmask_len_127),
> +		cmocka_unit_test(test_bitmask_len_128),
>  	};
>  	return cmocka_run_group_tests(tests, NULL, NULL);
>  }
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

