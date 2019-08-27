Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E637F9F07D
	for <lists+dm-devel@lfdr.de>; Tue, 27 Aug 2019 18:41:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D16FC0021D3;
	Tue, 27 Aug 2019 16:41:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A4DF60600;
	Tue, 27 Aug 2019 16:41:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F2513CBF;
	Tue, 27 Aug 2019 16:41:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7RGfBEj030585 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 27 Aug 2019 12:41:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2283D194BE; Tue, 27 Aug 2019 16:41:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx28.extmail.prod.ext.phx2.redhat.com
	[10.5.110.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1AC6196AE;
	Tue, 27 Aug 2019 16:41:05 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 418318AC6FF;
	Tue, 27 Aug 2019 16:40:51 +0000 (UTC)
Received: from callcc.thunk.org (guestnat-104-133-0-111.corp.google.com
	[104.133.0.111] (may be forged)) (authenticated bits=0)
	(User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x7RGeCWG021084
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 27 Aug 2019 12:40:13 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
	id 70A4F42049E; Tue, 27 Aug 2019 12:40:12 -0400 (EDT)
Date: Tue, 27 Aug 2019 12:40:12 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: "boojin.kim" <boojin.kim@samsung.com>
Message-ID: <20190827164012.GN28066@mit.edu>
Mail-Followup-To: "Theodore Y. Ts'o" <tytso@mit.edu>,
	"boojin.kim" <boojin.kim@samsung.com>,
	'Satya Tangirala' <satyat@google.com>,
	'Herbert Xu' <herbert@gondor.apana.org.au>,
	"'David S. Miller'" <davem@davemloft.net>,
	'Eric Biggers' <ebiggers@kernel.org>, 'Chao Yu' <chao@kernel.org>,
	'Jaegeuk Kim' <jaegeuk@kernel.org>,
	'Andreas Dilger' <adilger.kernel@dilger.ca>, dm-devel@redhat.com,
	'Mike Snitzer' <snitzer@redhat.com>,
	'Alasdair Kergon' <agk@redhat.com>, 'Jens Axboe' <axboe@kernel.dk>,
	'Krzysztof Kozlowski' <krzk@kernel.org>,
	'Kukjin Kim' <kgene@kernel.org>,
	'Jaehoon Chung' <jh80.chung@samsung.com>,
	'Ulf Hansson' <ulf.hansson@linaro.org>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-block@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
References: <CGME20190827083334epcas2p115d479190b9a72c886f66569add78203@epcas2p1.samsung.com>
	<03b201d55cb2$1d4d31b0$57e79510$@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <03b201d55cb2$1d4d31b0$57e79510$@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.69]); Tue, 27 Aug 2019 16:41:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]);
	Tue, 27 Aug 2019 16:41:01 +0000 (UTC) for IP:'18.9.28.11'
	DOMAIN:'outgoing-auth-1.mit.edu' HELO:'outgoing.mit.edu'
	FROM:'tytso@mit.edu' RCPT:''
X-RedHat-Spam-Score: -2.298  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 18.9.28.11 outgoing-auth-1.mit.edu 18.9.28.11
	outgoing-auth-1.mit.edu <tytso@mit.edu>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.69
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: 'Ulf Hansson' <ulf.hansson@linaro.org>, 'Mike Snitzer' <snitzer@redhat.com>,
	dm-devel@redhat.com, 'Andreas Dilger' <adilger.kernel@dilger.ca>,
	'Alasdair Kergon' <agk@redhat.com>, 'Eric Biggers' <ebiggers@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	'Herbert Xu' <herbert@gondor.apana.org.au>,
	'Krzysztof Kozlowski' <krzk@kernel.org>,
	'Satya Tangirala' <satyat@google.com>,
	'Jaehoon Chung' <jh80.chung@samsung.com>,
	'Kukjin Kim' <kgene@kernel.org>, linux-ext4@vger.kernel.org,
	'Chao Yu' <chao@kernel.org>, linux-block@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, 'Jaegeuk Kim' <jaegeuk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	'Jens Axboe' <axboe@kernel.dk>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	"'David S. Miller'" <davem@davemloft.net>
Subject: Re: [dm-devel] [PATCH 5/9] block: support diskcipher
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 27 Aug 2019 16:41:34 +0000 (UTC)

On Tue, Aug 27, 2019 at 05:33:33PM +0900, boojin.kim wrote:
> 
> Dear Satya.
> Keyslot manager is a good solution for ICE. And probably no issue for FMP.
> But, I think it's complicated for FMP because FMP doesn't need
> any keyslot control.

Hi Boojin,

I think the important thing to realize here is that there are a large
number of hardware devices for which the keyslot manager *is* needed.
And from the upstream kernel's perspective, supporting two different
schemes for supporting the inline encryption feature is more
complexity than just supporting one which is general enough to support
a wider variety of hardware devices.

If you want somethig which is only good for the hardware platform you
are charged to support, that's fine if it's only going to be in a
Samsung-specific kernel.  But if your goal is to get something that
works upstream, especially if it requires changes in core layers of
the kernel, it's important that it's general enough to support most,
if not all, if the hardware devices in the industry.

Regards,

					- Ted

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
