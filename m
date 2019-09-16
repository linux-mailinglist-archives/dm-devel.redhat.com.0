Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC1CB4023
	for <lists+dm-devel@lfdr.de>; Mon, 16 Sep 2019 20:17:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C99330832DA;
	Mon, 16 Sep 2019 18:17:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CE36196AE;
	Mon, 16 Sep 2019 18:17:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9525D4EDA6;
	Mon, 16 Sep 2019 18:16:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8GIGqL9013012 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 16 Sep 2019 14:16:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1D7BC410E; Mon, 16 Sep 2019 18:16:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E47219C4F;
	Mon, 16 Sep 2019 18:16:47 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F03A10CC1EB;
	Mon, 16 Sep 2019 18:16:45 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r5so388039wrm.12;
	Mon, 16 Sep 2019 11:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=xzC5REmOK/IHB+LeaElHKeBB1MF7Um0nAF1y+o7I2co=;
	b=d+jGubxBCYoXaPzhjZSOHut56uND8SvoTEcPVKsHSSbe3xKdD/Jf5BkvLdJJmNrkdY
	VQo0KhaNN4Z7XHcZJrbx0rXiHL5SVqLJNwDBbc5WcemX/37Z1WoLEEBAZj4F6kSMP2lp
	13XwMOpkJ0TENOQnND7z7yjccPSDhrQbXlXGtkjeeQ9yWpTtMY17uZXhnwbcZTSU77sd
	Du31byidJHJPJ7tZR/T8Q6lO216U1Gr0gdsUncSaDyLsNfUdm7iByf+wFVXNr5LRh7LG
	6k533RuFBwJKJVYNA+nOhV/fRkGasy5PYblmbENWrtpmJDCez78PGxBBLBYb15gWJ4LV
	36hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xzC5REmOK/IHB+LeaElHKeBB1MF7Um0nAF1y+o7I2co=;
	b=JHm+uSHW18w6okIVEyJselP4LrQmQHikhaVtEjDdoLDyvsJ0RLz4kwWkB4CNSMzy49
	QK4Dn3vhUF9msr5gJNeM6QL+ARXubsXwuLP1dYvPGtXgl05oh0J6m555MdNnJ3ggzdp1
	bCip2S05iTIj2/oI9BzSm+vpdzsS8g++H8E6UbfOsRfZhSgsJOAkbS7X52Ox8eA4F3dA
	eUPfEzacDUFs7PwZeSS/851EMSkm3eiNjMGxpL0ECb0yJFRKyYUiBi0jZ6TGQnHH/c6C
	JmmoKhlqAvhAaDw+QYQ1tAFjXPoi7+u+E+4UuuBc/m7jnUxKDyBcM8hpO5e0te1kKhUJ
	aFpA==
X-Gm-Message-State: APjAAAV9fMSH9S7hs0y3vvTZnMfCni2F+pC0KIlzYjSVQBB3BXmcAw+j
	y1P4faKG9Eyw3Ln8OCG8VfcWNNbk
X-Google-Smtp-Source: APXvYqyzs9RwUKVtbtQUQOF70BYKwY0uCDiBjDhJRbxOH4Fm7LUohI7CWZHQq8TDJPM4nvVVtffZpg==
X-Received: by 2002:a5d:4d87:: with SMTP id b7mr618595wru.148.1568657804023;
	Mon, 16 Sep 2019 11:16:44 -0700 (PDT)
Received: from [192.168.2.27] (39.35.broadband4.iol.cz. [85.71.35.39])
	by smtp.gmail.com with ESMTPSA id q124sm643302wma.5.2019.09.16.11.16.42
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 16 Sep 2019 11:16:43 -0700 (PDT)
To: Christoph Hellwig <hch@infradead.org>,
	Mikulas Patocka <mpatocka@redhat.com>
References: <alpine.LRH.2.02.1909160553360.11421@file01.intranet.prod.int.rdu2.redhat.com>
	<20190916180107.GA725@infradead.org>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <127b8c4e-a6dc-6d5e-caff-fe1a0ca3a5bb@gmail.com>
Date: Mon, 16 Sep 2019 20:16:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190916180107.GA725@infradead.org>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.65]);
	Mon, 16 Sep 2019 18:16:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Mon, 16 Sep 2019 18:16:45 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, lvm-devel@redhat.com,
	dm-devel@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm: introduce DM_GET_TARGET_VERSION
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 16 Sep 2019 18:17:05 +0000 (UTC)

On 16/09/2019 20:01, Christoph Hellwig wrote:
> On Mon, Sep 16, 2019 at 05:55:42AM -0400, Mikulas Patocka wrote:
>> This patch introduces a new ioctl DM_GET_TARGET_VERSION. It will load a
>> target that is specified in the "name" entry in the parameter structure
>> and return its version.
>>
>> This functionality is intended to be used by cryptsetup, so that it can
>> query kernel capabilities before activating the device.
> 
> Well, if you want to query kernel features you better ask for a feature
> bitmap than a version number, which can be rather meaningless with
> the amount of backporting that is going on.

Actually we have a feature bitmap in userspace (derived from dm target version)
and there was even a nice versioning scheme way when backporting features
(used in RHEL for example).

Most of the libcrypsetup features that depend on some DM internals works the way
that userspace tries the feature and fallbacks if it fails.

But many functions are really user-unfriendly this way - imagine we ask for passphrases,
calculate LUKS keyslots, do benchmarks (all this do not need DM backend) - and then it
fails on activation because DM table load detects old (or missing) dm-crypt feature.
(There was no way to get dm target version before table load if module is not loaded.)

And I tried to avoid modprobe calls from libcryptsetup.

So the main idea behind this was just use already existing functionality
in kernel DM, and provide simple user-friendly way to detect some incompatibilites
more early. If detection is not there, we just fallback to the old way.

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
