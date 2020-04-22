Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id AE4311B4F60
	for <lists+dm-devel@lfdr.de>; Wed, 22 Apr 2020 23:27:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587590859;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0aRoY9NzYxLzn8JceTvnbYIB52bmoHU+mV1kZ7VPmoA=;
	b=bf1v+LQjIcIrSE3DzF4a9ayiIxfZtXAp8zHe3WjK8bpZzZzWa3F+kLSVi3xPE9ckcuzCVz
	mXVYbe3DEv9Z6Zx6JUxLnWEgBq7Idaa9ou0Em4PwrqJ9tvsPx6PAFYJ6BBLjfZ76xZn7mL
	QJog+PFAYWq+hnKs+MmwayuN337LDcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-Sd_hBlaPOr2p3Js4bDEb8Q-1; Wed, 22 Apr 2020 17:27:37 -0400
X-MC-Unique: Sd_hBlaPOr2p3Js4bDEb8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB84D100CCC0;
	Wed, 22 Apr 2020 21:27:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1190B1000079;
	Wed, 22 Apr 2020 21:27:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A6FED938FB;
	Wed, 22 Apr 2020 21:27:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03MLPhJ9008427 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Apr 2020 17:25:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A7A47600F7; Wed, 22 Apr 2020 21:25:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10EE9600D2;
	Wed, 22 Apr 2020 21:25:38 +0000 (UTC)
Date: Wed, 22 Apr 2020 17:25:38 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: kbuild test robot <lkp@intel.com>
Message-ID: <20200422212538.GA10422@redhat.com>
References: <202004230513.auAlcg7E%lkp@intel.com>
MIME-Version: 1.0
In-Reply-To: <202004230513.auAlcg7E%lkp@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>, dm-devel@redhat.com,
	kbuild-all@lists.01.org
Subject: Re: [dm-devel] [dm:for-next 27/28] drivers/md/dm-crypt.c:2281:
 undefined reference to `key_type_encrypted'
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


I fixed this ~3 minutes after pushing.. amazing how quick the kbuild test robot is!

But thanks,
Mike

On Wed, Apr 22 2020 at  5:21pm -0400,
kbuild test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
> head:   2d56364c7c7ba64576c37a16c8af98f66b4bb16b
> commit: 5cacab0334b940164ad6aac39712f4d3b06076bc [27/28] dm crypt: support using encrypted keys
> config: i386-randconfig-e001-20200421 (attached as .config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce:
>         git checkout 5cacab0334b940164ad6aac39712f4d3b06076bc
>         # save the attached .config to linux build tree
>         make ARCH=i386 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    ld: drivers/md/dm-crypt.o: in function `crypt_set_keyring_key':
> >> drivers/md/dm-crypt.c:2281: undefined reference to `key_type_encrypted'
> 
> vim +2281 drivers/md/dm-crypt.c
> 
>   2251	
>   2252	static int crypt_set_keyring_key(struct crypt_config *cc, const char *key_string)
>   2253	{
>   2254		char *new_key_string, *key_desc;
>   2255		int ret;
>   2256		struct key_type *type;
>   2257		struct key *key;
>   2258		int (*set_key)(struct crypt_config *cc, struct key *key);
>   2259	
>   2260		/*
>   2261		 * Reject key_string with whitespace. dm core currently lacks code for
>   2262		 * proper whitespace escaping in arguments on DM_TABLE_STATUS path.
>   2263		 */
>   2264		if (contains_whitespace(key_string)) {
>   2265			DMERR("whitespace chars not allowed in key string");
>   2266			return -EINVAL;
>   2267		}
>   2268	
>   2269		/* look for next ':' separating key_type from key_description */
>   2270		key_desc = strpbrk(key_string, ":");
>   2271		if (!key_desc || key_desc == key_string || !strlen(key_desc + 1))
>   2272			return -EINVAL;
>   2273	
>   2274		if (!strncmp(key_string, "logon:", key_desc - key_string + 1)) {
>   2275			type = &key_type_logon;
>   2276			set_key = set_key_user;
>   2277		} else if (!strncmp(key_string, "user:", key_desc - key_string + 1)) {
>   2278			type = &key_type_user;
>   2279			set_key = set_key_user;
>   2280		} else if (!strncmp(key_string, "encrypted:", key_desc - key_string + 1)) {
> > 2281			type = &key_type_encrypted;
>   2282			set_key = set_key_encrypted;
>   2283		} else {
>   2284			return -EINVAL;
>   2285		}
>   2286	
>   2287		new_key_string = kstrdup(key_string, GFP_KERNEL);
>   2288		if (!new_key_string)
>   2289			return -ENOMEM;
>   2290	
>   2291		key = request_key(type, key_desc + 1, NULL);
>   2292		if (IS_ERR(key)) {
>   2293			kzfree(new_key_string);
>   2294			return PTR_ERR(key);
>   2295		}
>   2296	
>   2297		down_read(&key->sem);
>   2298	
>   2299		ret = set_key(cc, key);
>   2300		if (ret < 0) {
>   2301			up_read(&key->sem);
>   2302			key_put(key);
>   2303			kzfree(new_key_string);
>   2304			return ret;
>   2305		}
>   2306	
>   2307		up_read(&key->sem);
>   2308		key_put(key);
>   2309	
>   2310		/* clear the flag since following operations may invalidate previously valid key */
>   2311		clear_bit(DM_CRYPT_KEY_VALID, &cc->flags);
>   2312	
>   2313		ret = crypt_setkey(cc);
>   2314	
>   2315		if (!ret) {
>   2316			set_bit(DM_CRYPT_KEY_VALID, &cc->flags);
>   2317			kzfree(cc->key_string);
>   2318			cc->key_string = new_key_string;
>   2319		} else
>   2320			kzfree(new_key_string);
>   2321	
>   2322		return ret;
>   2323	}
>   2324	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

