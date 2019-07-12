Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D2B6845F
	for <lists+dm-devel@lfdr.de>; Mon, 15 Jul 2019 09:29:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F0B23356DA;
	Mon, 15 Jul 2019 07:29:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A13B860C05;
	Mon, 15 Jul 2019 07:29:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E95A41F63;
	Mon, 15 Jul 2019 07:29:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6CHXBYx000766 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 12 Jul 2019 13:33:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7523760C73; Fri, 12 Jul 2019 17:33:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C588E60C64;
	Fri, 12 Jul 2019 17:33:04 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by mx1.redhat.com (Postfix) with ESMTP id 486223082231;
	Fri, 12 Jul 2019 17:33:03 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1029)
	id B8E2F20B7185; Fri, 12 Jul 2019 10:33:02 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by linux.microsoft.com (Postfix) with ESMTP id B512A300790D;
	Fri, 12 Jul 2019 10:33:02 -0700 (PDT)
Date: Fri, 12 Jul 2019 10:33:02 -0700 (PDT)
From: Jaskaran Singh Khurana <jaskarankhurana@linux.microsoft.com>
X-X-Sender: jaskarankhurana@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
To: gmazyland@gmail.com
In-Reply-To: <MN2PR21MB12008A962D4DD8662B3614508AF20@MN2PR21MB1200.namprd21.prod.outlook.com>
Message-ID: <alpine.LRH.2.21.1907121025510.66082@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
References: <20190701181958.6493-1-jaskarankhurana@linux.microsoft.com>
	<MN2PR21MB12008A962D4DD8662B3614508AF20@MN2PR21MB1200.namprd21.prod.outlook.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Fri, 12 Jul 2019 17:33:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Fri, 12 Jul 2019 17:33:03 +0000 (UTC) for IP:'13.77.154.182'
	DOMAIN:'linux.microsoft.com' HELO:'linux.microsoft.com'
	FROM:'jaskarankhurana@linux.microsoft.com' RCPT:''
X-RedHat-Spam-Score: -6.708  (ENV_AND_HDR_SPF_MATCH, PDS_NO_HELO_DNS,
	SPF_HELO_PASS, SPF_PASS,
	USER_IN_DEF_SPF_WL) 13.77.154.182 linux.microsoft.com 13.77.154.182
	linux.microsoft.com <jaskarankhurana@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 15 Jul 2019 03:28:28 -0400
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Mon, 15 Jul 2019 07:29:34 +0000 (UTC)


Hello Milan,

> Changes in v6:
>
> Address comments from Milan Broz and Eric Biggers on v5.
>
> -Keep the verification code under config DM_VERITY_VERIFY_ROOTHASH_SIG.
>
> -Change the command line parameter to requires_signatures(bool) which will
> force root hash to be signed and trusted if specified.
>
> -Fix the signature not being present in verity_status. Merged the
> https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fmbroz%2Flinux.git%2Fcommit%2F%3Fh%3Ddm-cryptsetup%26id%3Da26c10806f5257e255b6a436713127e762935ad3&amp;data=02%7C01%7CJaskaran.Khurana%40microsoft.com%7C18f92445e46940aeebb008d6fe50c610%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C636976020210890638&amp;sdata=aY0V9%2FBz2RHryIvoftGKUGnyPp9Fsc1JY4FZbHfW4hg%3D&amp;reserved=0
> made by Milan Broz and tested it.
>
>

Could you please provide feedback on this v6 version.

Regards,
Jaskaran

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
