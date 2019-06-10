Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEFB3C55D
	for <lists+dm-devel@lfdr.de>; Tue, 11 Jun 2019 09:48:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DCA3685360;
	Tue, 11 Jun 2019 07:47:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA4B61001B36;
	Tue, 11 Jun 2019 07:47:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 722681806B0F;
	Tue, 11 Jun 2019 07:47:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5ALOBau024600 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Jun 2019 17:24:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0298360C47; Mon, 10 Jun 2019 21:24:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4201A60C4E;
	Mon, 10 Jun 2019 21:24:04 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by mx1.redhat.com (Postfix) with ESMTP id A853B22389A;
	Mon, 10 Jun 2019 21:22:56 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1029)
	id 4BCD320B7194; Mon, 10 Jun 2019 14:22:56 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by linux.microsoft.com (Postfix) with ESMTP id 41DCC311B1C8;
	Mon, 10 Jun 2019 14:22:56 -0700 (PDT)
Date: Mon, 10 Jun 2019 14:22:56 -0700 (PDT)
From: Jaskaran Singh Khurana <jaskarankhurana@linux.microsoft.com>
X-X-Sender: jaskarankhurana@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
To: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <54170d18-31c7-463d-10b5-9af8b666df0f@gmail.com>
Message-ID: <alpine.LRH.2.21.1906101411520.15431@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
References: <20190607223140.16979-1-jaskarankhurana@linux.microsoft.com>
	<20190607223140.16979-2-jaskarankhurana@linux.microsoft.com>
	<54170d18-31c7-463d-10b5-9af8b666df0f@gmail.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Mon, 10 Jun 2019 21:23:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Mon, 10 Jun 2019 21:23:47 +0000 (UTC) for IP:'13.77.154.182'
	DOMAIN:'linux.microsoft.com' HELO:'linux.microsoft.com'
	FROM:'jaskarankhurana@linux.microsoft.com' RCPT:''
X-RedHat-Spam-Score: -8.002  (ENV_AND_HDR_SPF_MATCH, SPF_HELO_PASS, SPF_PASS,
	USER_IN_DEF_SPF_WL) 13.77.154.182 linux.microsoft.com
	13.77.154.182 linux.microsoft.com
	<jaskarankhurana@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 11 Jun 2019 03:46:30 -0400
Cc: scottsh@microsoft.com, dm-devel@redhat.com, snitzer@redhat.com,
	ebiggers@google.com, linux-kernel@vger.kernel.org,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	Mikulas Patocka <mpatocka@redhat.com>,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	agk@redhat.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 11 Jun 2019 07:48:09 +0000 (UTC)



On Sat, 8 Jun 2019, Milan Broz wrote:

> On 08/06/2019 00:31, Jaskaran Khurana wrote:
> Why is this different from existing FEC extension?
> FEC uses ifdefs in header to blind functions if config is not set.
>
> ifeq ($(CONFIG_DM_VERITY_FEC),y)
> dm-verity-objs                  += dm-verity-fec.o
> endif
>
> ...
>

The reasoning for doing it this way is that there might be scripts that 
create a device mapper device and then mount and use it, with the 
signature verification enabled in kernel the scripts would be passing the 
signature like:

veritysetup open params... --roothash-sig=<sig.p7>

If later due to some reason the DM_VERITY_VERIFY_ROOTHASH_SIG is disabled 
if we do not recognize the parameter then the scripts need to be changed 
or else they will fail with INVALID argument,
in current implementation the parameter for signature is always parsed but
enforced based on the config being set, so the scripts need not be 
changed.
Let me know if you still feel I should be changing this and I will be 
happy to make the change, just wanted to share my reasoning for this.

>
> Thanks,
> Milan
>
Regards,
Jaskaran

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
