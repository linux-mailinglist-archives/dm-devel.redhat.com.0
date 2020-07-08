Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 466E521942D
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 01:15:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-52DZkF9JNkCoYw3EERRXIg-1; Wed, 08 Jul 2020 19:15:34 -0400
X-MC-Unique: 52DZkF9JNkCoYw3EERRXIg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E82B71005510;
	Wed,  8 Jul 2020 23:15:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADF7860E1C;
	Wed,  8 Jul 2020 23:15:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 332901809547;
	Wed,  8 Jul 2020 23:15:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 068NEaSm021799 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 19:14:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8FD753325E; Wed,  8 Jul 2020 23:14:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B70B3325D
	for <dm-devel@redhat.com>; Wed,  8 Jul 2020 23:14:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BE3E18A6660
	for <dm-devel@redhat.com>; Wed,  8 Jul 2020 23:14:34 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-167-Wa1VoMZcOeqTv7kKWhVkUA-1; Wed, 08 Jul 2020 19:14:32 -0400
X-MC-Unique: Wa1VoMZcOeqTv7kKWhVkUA-1
Received: by mail-pg1-f178.google.com with SMTP id e8so82315pgc.5
	for <dm-devel@redhat.com>; Wed, 08 Jul 2020 16:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qXlCDNHI0ZK15y0LOuAYzGPtynusnw7LtwDb5Yj2OtE=;
	b=Y5QWmgGrjmNter+900z7ZH53OPijuub/WgLJfp7HrlZ/9B8fV7hzO8jOaBHqz8xcAe
	qJ8AXJe3Y/RmPhtO6wXaWwGMb6bnRYTgdWYc+Hc527oWFxk2ZNPvrzC9eeaiEc/gFfef
	o2qL1TW/Vb/3sgUx8rA8jh17eaajizRnn3C+/5GwWlexpYTTxHPUcuvozSKKWPi74QVf
	iIQflnsyTQdl7vHL4MsjL5zbjih381vVUpCIW5U2l60oWCkOPn0Su7yafbLmDpf3eqG6
	BOrcbFP8GG/dIEo7QXUfdc0KryxhnZEYRAoTwEPtCkUUTsnPKcmcMrbumPwv2jiWgMIV
	0diQ==
X-Gm-Message-State: AOAM533uyj8r8Kw0XCh60Rq7JpUrkbG0sNojrK1QSdWgAowQtKRgWEK2
	ezOmQj8tL0VeLdvpSnLmfY1AJg==
X-Google-Smtp-Source: ABdhPJwxXRU58dnJ8SaVTE59SieM0UMi6WQspGfeG513juta/gCc2a5inFjMHD1HHOikaeJsZTW/MA==
X-Received: by 2002:a63:7741:: with SMTP id s62mr50514486pgc.332.1594250070946;
	Wed, 08 Jul 2020 16:14:30 -0700 (PDT)
Received: from [192.168.1.182] ([66.219.217.173])
	by smtp.gmail.com with ESMTPSA id
	n137sm721427pfd.194.2020.07.08.16.14.29
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 08 Jul 2020 16:14:30 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20200701090622.3354860-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <b5d6df17-68af-d535-79e4-f95e16dd5632@kernel.dk>
Date: Wed, 8 Jul 2020 17:14:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200701090622.3354860-1-hch@lst.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, linux-mm@kvack.org,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, drbd-dev@tron.linbit.com,
	dm-devel@redhat.com, Tejun Heo <tj@kernel.org>,
	cgroups@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: Re: [dm-devel] remove dead bdi congestion leftovers
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gNy8xLzIwIDM6MDYgQU0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IEhpIEplbnMsCj4g
Cj4gd2UgaGF2ZSBhIGxvdCBvZiBiZGkgY29uZ2VzdGlvbiByZWxhdGVkIGNvZGUgdGhhdCBpcyBs
ZWZ0IGFyb3VuZCB3aXRob3V0Cj4gYW55IHVzZS4gIFRoaXMgc2VyaWVzIHJlbW92ZXMgaXQgaW4g
cHJlcGFyYXRpb24gb2Ygc29ydGluZyBvdXQgdGhlIGJkaQo+IGxpZmV0aW1lIHJ1bGVzIHByb3Bl
cmx5LgoKUGxlYXNlIHJ1biBzZXJpZXMgbGlrZSB0aGlzIHRocm91Z2ggYSBmdWxsIGNvbXBpbGF0
aW9uLCBmb3IgYm90aCB0aGlzIG9uZQphbmQgdGhlIHByZXZpb3VzIHNlcmllcyBJIGhhZCB0byBm
aXggdXAgaXNzdWVzIGxpa2UgdGhpczoKCmRyaXZlcnMvbWQvYmNhY2hlL3JlcXVlc3QuYzogSW4g
ZnVuY3Rpb24g4oCYYmNoX2NhY2hlZF9kZXZfcmVxdWVzdF9pbml04oCZOgpkcml2ZXJzL21kL2Jj
YWNoZS9yZXF1ZXN0LmM6MTIzMzoxODogd2FybmluZzogdW51c2VkIHZhcmlhYmxlIOKAmGfigJkg
Wy1XdW51c2VkLXZhcmlhYmxlXQogMTIzMyB8ICBzdHJ1Y3QgZ2VuZGlzayAqZyA9IGRjLT5kaXNr
LmRpc2s7CiAgICAgIHwgICAgICAgICAgICAgICAgICBeCmRyaXZlcnMvbWQvYmNhY2hlL3JlcXVl
c3QuYzogSW4gZnVuY3Rpb24g4oCYYmNoX2ZsYXNoX2Rldl9yZXF1ZXN0X2luaXTigJk6CmRyaXZl
cnMvbWQvYmNhY2hlL3JlcXVlc3QuYzoxMzIwOjE4OiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUg
4oCYZ+KAmSBbLVd1bnVzZWQtdmFyaWFibGVdCiAxMzIwIHwgIHN0cnVjdCBnZW5kaXNrICpnID0g
ZC0+ZGlzazsKICAgICAgfCAgICAgICAgICAgICAgICAgIF4KCkRpZCB0aGUgc2FtZSBoZXJlLCBh
cHBsaWVkIGl0LgoKLS0gCkplbnMgQXhib2UKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1k
ZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9k
bS1kZXZlbA==

