Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F88D49A33
	for <lists+dm-devel@lfdr.de>; Tue, 18 Jun 2019 09:16:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 05C4BB2DD1;
	Tue, 18 Jun 2019 07:16:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 576B180DB3;
	Tue, 18 Jun 2019 07:16:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96C158E1F;
	Tue, 18 Jun 2019 07:16:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5HKeEw8021058 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Jun 2019 16:40:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F36C91F2E; Mon, 17 Jun 2019 20:40:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A4CD8CB92;
	Mon, 17 Jun 2019 20:40:10 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by mx1.redhat.com (Postfix) with ESMTP id 8C8B859473;
	Mon, 17 Jun 2019 20:39:53 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1029)
	id EE5F720BCFC5; Mon, 17 Jun 2019 13:39:52 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by linux.microsoft.com (Postfix) with ESMTP id E8F2C3010321;
	Mon, 17 Jun 2019 13:39:52 -0700 (PDT)
Date: Mon, 17 Jun 2019 13:39:52 -0700 (PDT)
From: Jaskaran Singh Khurana <jaskarankhurana@linux.microsoft.com>
X-X-Sender: jaskarankhurana@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
To: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <ab346931-1d1b-bd2f-8314-ee4779bd44bf@gmail.com>
Message-ID: <alpine.LRH.2.21.1906171338590.64763@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
References: <20190613010610.4364-1-jaskarankhurana@linux.microsoft.com>
	<20190613010610.4364-2-jaskarankhurana@linux.microsoft.com>
	<ab346931-1d1b-bd2f-8314-ee4779bd44bf@gmail.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Mon, 17 Jun 2019 20:39:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Mon, 17 Jun 2019 20:39:54 +0000 (UTC) for IP:'13.77.154.182'
	DOMAIN:'linux.microsoft.com' HELO:'linux.microsoft.com'
	FROM:'jaskarankhurana@linux.microsoft.com' RCPT:''
X-RedHat-Spam-Score: -8.002  (ENV_AND_HDR_SPF_MATCH, SPF_HELO_PASS, SPF_PASS,
	USER_IN_DEF_SPF_WL) 13.77.154.182 linux.microsoft.com
	13.77.154.182 linux.microsoft.com
	<jaskarankhurana@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 18 Jun 2019 03:15:24 -0400
Cc: scottsh@microsoft.com, dm-devel@redhat.com, snitzer@redhat.com,
	ebiggers@google.com, linux-kernel@vger.kernel.org,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	mpatocka@redhat.com, linux-fsdevel@vger.kernel.org,
	linux-integrity@vger.kernel.org, agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH v4 1/1] Add dm verity root hash pkcs7 sig
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Tue, 18 Jun 2019 07:16:54 +0000 (UTC)



On Mon, 17 Jun 2019, Milan Broz wrote:

> On 13/06/2019 03:06, Jaskaran Khurana wrote:
> ...
>
>> Adds DM_VERITY_VERIFY_ROOTHASH_SIG_FORCE: roothash signature *must* be
>> specified for all dm verity volumes and verification must succeed prior
>> to creation of device mapper block device.
>
> I had a quick discussion about this and one suggestion was
> to add dm-verity kernel module parameter instead of a new config option.
>
> The idea is that if you can control kernel boot commandline, you can add it
> there with the same effect (expecting that root device is on dm-verity as well).
>
> Isn't this better option or it is not going to work for you?

Seems like a better option to me, I will make the change and remove both 
the configs.

>
> Milan
>
Regards,
Jaskaran

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
