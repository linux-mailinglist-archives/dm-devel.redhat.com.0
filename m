Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C09978E0
	for <lists+dm-devel@lfdr.de>; Wed, 21 Aug 2019 14:10:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75403308213F;
	Wed, 21 Aug 2019 12:10:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CAEC2C8CE;
	Wed, 21 Aug 2019 12:10:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 78C73180085A;
	Wed, 21 Aug 2019 12:10:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7LC9w5S005101 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 21 Aug 2019 08:09:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 745FC5C231; Wed, 21 Aug 2019 12:09:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F6595C21A
	for <dm-devel@redhat.com>; Wed, 21 Aug 2019 12:09:55 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8390308FC23
	for <dm-devel@redhat.com>; Wed, 21 Aug 2019 12:09:54 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id gn20so1246039plb.2
	for <dm-devel@redhat.com>; Wed, 21 Aug 2019 05:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=UT6yE/roxwyyBSRfLOwrFlilraLjBXjoNWJQAsldDVo=;
	b=1mTbly5hNN6suDS+BwBXn5tZNQRoJv3U+6eGIZWkxOpX8gp4MfK0srbyshCamPl8cE
	oynbwAZaUVd3iYuDw/fFqllqnUyyMdhGmWDFTWD0+uRBHO1RABomqwNTPTloesNaBCP/
	OF0wNlT1X2HUApuEYt9hqsB3ukfCOmKOxQ9VlFGyTVla9DArrhzV46cf0e1hqSL0Em1S
	kMKT+OUOB39Lc9u+MllIcA6W2VixaWAmIOOCqIPym//+KF+bJLzrXd5uXWfD6RF+tn8O
	fEItbmLNgpz+3xyfCw5xuoCb8BCqv/jPsevOVEPakCBbt5mOdjvlnK19JQHJXISJTFII
	+AuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UT6yE/roxwyyBSRfLOwrFlilraLjBXjoNWJQAsldDVo=;
	b=eA7Iu0tikFS/ddbvUmuq40CkCk+cB30Ft/S6twyOGXqoKQM4I2ldQHTAIdqIoHDYKy
	/3HfqPKxco8j9Y4Y0PX966u++BC9Zfku8FTJ610xxugDjfd1ihDJxXiPLBeiTWfDZQlO
	NMrlrH4i78k85xBCO3dt5ERAShfn+D6MAfH85/fOyN+zME1a8gbLcP2327kpqTTFd7I8
	66Z5jivnDGCXUAlusONmvh6WFGdeipUkIRmqpwFe7Pp2j7GV5V3k9BrKr8LHYJeoOCFJ
	mBqdkYpO2BkeKEBJuNMyGo9yj8+DW6qnsz/3JBMdqr2gL4y485l99xmTry6O/AdkJYDq
	7DRA==
X-Gm-Message-State: APjAAAVx0AFVbEO7HFjrEtNoADMwb9AgLmxWYs8dRMR/mUumECLGW9QL
	O+xSCjqrvQbgFa5kAdcWClJvrw==
X-Google-Smtp-Source: APXvYqxsoe31YiWALXWqRLHXasZTZR3nM8GXNUHwTUUu4EkoxYDPJeCxhjU4HkYSZ/HpLNbIJ9AOOg==
X-Received: by 2002:a17:902:a410:: with SMTP id
	p16mr17723995plq.150.1566389394293; 
	Wed, 21 Aug 2019 05:09:54 -0700 (PDT)
Received: from [192.168.1.188] (66.29.164.166.static.utbb.net. [66.29.164.166])
	by smtp.gmail.com with ESMTPSA id
	z4sm22521476pfg.166.2019.08.21.05.09.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Aug 2019 05:09:53 -0700 (PDT)
To: "boojin.kim" <boojin.kim@samsung.com>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <CGME20190821064226epcas2p2835b8a9084988b79107e54abfc5e7dab@epcas2p2.samsung.com>
	<004101d557eb$98b00060$ca100120$@samsung.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <6ea5e5db-4dd4-719f-3b3e-b89099636ea6@kernel.dk>
Date: Wed, 21 Aug 2019 06:09:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <004101d557eb$98b00060$ca100120$@samsung.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 21 Aug 2019 12:09:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Wed, 21 Aug 2019 12:09:54 +0000 (UTC) for IP:'209.85.214.193'
	DOMAIN:'mail-pl1-f193.google.com'
	HELO:'mail-pl1-f193.google.com' FROM:'axboe@kernel.dk' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.214.193 mail-pl1-f193.google.com 209.85.214.193
	mail-pl1-f193.google.com <axboe@kernel.dk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: 'Ulf Hansson' <ulf.hansson@linaro.org>, 'Mike Snitzer' <snitzer@redhat.com>,
	dm-devel@redhat.com, 'Andreas Dilger' <adilger.kernel@dilger.ca>,
	'Alasdair Kergon' <agk@redhat.com>, 'Eric Biggers' <ebiggers@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	'Herbert Xu' <herbert@gondor.apana.org.au>,
	'Krzysztof Kozlowski' <krzk@kernel.org>,
	'Jaehoon Chung' <jh80.chung@samsung.com>,
	'Kukjin Kim' <kgene@kernel.org>, linux-ext4@vger.kernel.org,
	'Chao Yu' <chao@kernel.org>, linux-fscrypt@vger.kernel.org,
	'Jaegeuk Kim' <jaegeuk@kernel.org>, linux-arm-kernel@lists.infradead.org,
	"'Theodore Y. Ts'o'" <tytso@mit.edu>, linux-mmc@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 21 Aug 2019 12:10:27 +0000 (UTC)

On 8/21/19 12:42 AM, boojin.kim wrote:
> This patch supports crypto information to be maintained via BIO
> and passed to the storage driver.
> 
> To do this, 'bi_aux_private', 'REQ_CYPTE' and 'bi_dun' are added
> to the block layer.
> 
> 'bi_aux_private' is added for loading additional private information into
> BIO.
> 'REQ_CRYPT' is added to distinguish that bi_aux_private is being used
> for diskcipher.
> F2FS among encryption users uses DUN(device unit number) as
> the IV(initial vector) for cryptographic operations.
> DUN is stored in 'bi_dun' of bi_iter as a specific value for each BIO.
> 
> Before attempting to merge the two BIOs, the operation is also added to
> verify that the crypto information contained in two BIOs is consistent.

This isn't going to happen. With this, and the inline encryption
proposed by Google, we'll bloat the bio even more. At least the Google
approach didn't include bio iter changes as well.

Please work it out between yourselves so we can have a single, clean
abstraction that works for both.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
