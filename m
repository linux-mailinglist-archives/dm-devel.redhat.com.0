Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AB498E55
	for <lists+dm-devel@lfdr.de>; Thu, 22 Aug 2019 10:50:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5369C3082128;
	Thu, 22 Aug 2019 08:50:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0358A600CD;
	Thu, 22 Aug 2019 08:50:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55B461800B76;
	Thu, 22 Aug 2019 08:50:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7M8nw2b013754 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 22 Aug 2019 04:49:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0042B1001B28; Thu, 22 Aug 2019 08:49:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE3671001B17
	for <dm-devel@redhat.com>; Thu, 22 Aug 2019 08:49:55 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9796D308FBA0
	for <dm-devel@redhat.com>; Thu, 22 Aug 2019 08:49:54 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id h8so6808041edv.7
	for <dm-devel@redhat.com>; Thu, 22 Aug 2019 01:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cloud.ionos.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=GB3BnyX//0LxQUlKZs1v5lBLtwZq+I1BzkyauFnkReM=;
	b=GIl7zRle9i0EKht1Uzvu/mFqu4kZOQg45K+ctg9n4+TY1CqIcwBcEbsnBkAdGUaQTY
	Tfqwq8L/1hg79X3UoVdHfw9/GnGVR5FOqRV1knbsHHHNwWno1VEfIlPvIJIfUNE+8107
	MzIPGen33ngySUAzd8vc56pak69gvF+rOLvGq3FkeDtgTBqEiQszrs4zCPcORRmszq3T
	z+vUiH3a82s9N5vgIX/Q0twetwuFiwtEg87dZfjQQbIDdTHlUFTh3umJUqi4gpnszVHD
	GoWy8r8C55UqiQyT2Hy0pk8oEhWh9zFZAnrYOFLytFOaPWbU+ytl9U3oO+EIIx52fy4A
	dyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=GB3BnyX//0LxQUlKZs1v5lBLtwZq+I1BzkyauFnkReM=;
	b=LqyuLM2/q+lXRtnUTcMOKiVnE9P8t0fY3ODVf6MvSMBEOj8CLynYCHGgSf6rBLgZpg
	6mTrzIRTLGQSJWuuIaNhRqpEq/fbDy3JIC/wYUuqBNoAxcNTFV8MHdxfjIGEUtD7LN0l
	6Oai1T/kgMeQFWiQgp4K20teNAkrVHzexchHGgdEaaqiOgbqVKXBJZFlKwwO8XHWcC9x
	nECC9rfPl/NdGop1Ferd3c9LS/oP8npbk5SikT8QGvTUxkzUxe/jC2I35r6QnHaYb1U+
	dJ1hti+OYXiWc4As8obrPBcvVYGhtk5r0tnSNB4ckfGvuEKg1WP2tgeulYyvuSgBdhcx
	H/LQ==
X-Gm-Message-State: APjAAAV9qiw3Z8klrZZup8Ww++G8TwZbR2UpUNeg/3PzjnOjSr6/6Fil
	rd5Lre4yd9fvhd/EsohYrxJPwxorSz0=
X-Google-Smtp-Source: APXvYqxbm7VmKEK9AjIgqdGk2W27jQvIU5lbFU+j3iGT6v4bhB05KXOOtrjr3CKqcfVDi/ILILf38g==
X-Received: by 2002:a17:906:70c3:: with SMTP id
	g3mr30062420ejk.195.1566463793384; 
	Thu, 22 Aug 2019 01:49:53 -0700 (PDT)
Received: from ?IPv6:2a02:247f:ffff:2540:a882:5953:17cf:1b5f?
	([2001:1438:4010:2540:a882:5953:17cf:1b5f])
	by smtp.gmail.com with ESMTPSA id
	ns22sm3556760ejb.9.2019.08.22.01.49.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Aug 2019 01:49:52 -0700 (PDT)
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>, linux-raid@vger.kernel.org
References: <20190816134059.29751-1-gpiccoli@canonical.com>
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Message-ID: <ca2096ca-8cb2-468f-89d4-24cd059b8a6b@cloud.ionos.com>
Date: Thu, 22 Aug 2019 10:49:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816134059.29751-1-gpiccoli@canonical.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 22 Aug 2019 08:49:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Thu, 22 Aug 2019 08:49:54 +0000 (UTC) for IP:'209.85.208.67'
	DOMAIN:'mail-ed1-f67.google.com' HELO:'mail-ed1-f67.google.com'
	FROM:'guoqing.jiang@cloud.ionos.com' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.208.67 mail-ed1-f67.google.com 209.85.208.67
	mail-ed1-f67.google.com <guoqing.jiang@cloud.ionos.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, jay.vosburgh@canonical.com,
	dm-devel@redhat.com, Song Liu <songliubraving@fb.com>,
	NeilBrown <neilb@suse.com>
Subject: Re: [dm-devel] [PATCH v2 1/2] md raid0/linear: Introduce new array
 state 'broken'
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Thu, 22 Aug 2019 08:50:34 +0000 (UTC)

Hi,

On 8/16/19 3:40 PM, Guilherme G. Piccoli wrote:
> +static bool linear_is_missing_dev(struct mddev *mddev)
> +{
> +	struct md_rdev *rdev;
> +	static int already_missing;
> +	int def_disks, work_disks = 0;
> +
> +	def_disks = mddev->raid_disks;
> +	rdev_for_each(rdev, mddev)
> +		if (rdev->bdev->bd_disk->flags & GENHD_FL_UP)
> +			work_disks++;
> +
> +	if (unlikely(def_disks - work_disks)) {

If my understanding is correct, after enter the branch,

> +		if (already_missing < (def_disks - work_disks)) {

the above is always true since already_missing should be '0', right?
If so, maybe the above checking is pointless.

> +			already_missing = def_disks - work_disks;
> +			pr_warn("md: %s: linear array has %d missing/failed members\n",
> +				mdname(mddev), already_missing);
> +		}
> +		return true;
> +	}
> +
> +	already_missing = 0;
> +	return false;
> +}
> +.

I'd suggest something like, just FYI.

bool already_missing = false;
int missing_disks;

missing_disks = def_disks - work_disks;
if (unlikely(missing_disks)) {
	already_missing = true;
	pr_warn("md: %s: linear array has %d missing/failed members\n", mdname(mddev), missing_disks);
}
return already_missing;


Thanks,
Guoqing

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
