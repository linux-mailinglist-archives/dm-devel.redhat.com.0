Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 28F6922925B
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jul 2020 09:40:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-b-vzRjzdPhiE0IWCd0lolw-1; Wed, 22 Jul 2020 03:40:27 -0400
X-MC-Unique: b-vzRjzdPhiE0IWCd0lolw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7F3780183C;
	Wed, 22 Jul 2020 07:40:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8176E1000232;
	Wed, 22 Jul 2020 07:40:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 37EF5730D7;
	Wed, 22 Jul 2020 07:40:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06M7Tk8Z015880 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 03:29:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DC11F5C662; Wed, 22 Jul 2020 07:29:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from fornost.hmeau.com (vpn2-54-195.bne.redhat.com [10.64.54.195])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C821F69320;
	Wed, 22 Jul 2020 07:29:43 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
	by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
	id 1jy9C0-0002pI-51; Wed, 22 Jul 2020 17:29:33 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
	Wed, 22 Jul 2020 17:29:32 +1000
Date: Wed, 22 Jul 2020 17:29:32 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>
Message-ID: <20200722072932.GA27544@gondor.apana.org.au>
References: <20200716115538.GA31461@gondor.apana.org.au>
	<8eefed8b-5ad5-424b-ab32-85e0cbac0a15@nxp.com>
MIME-Version: 1.0
In-Reply-To: <8eefed8b-5ad5-424b-ab32-85e0cbac0a15@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Eric Biggers <ebiggers@kernel.org>, dm-devel@redhat.com,
	mpatocka@redhat.com, linux-crypto@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v2 0/7] crypto: add
	CRYPTO_ALG_ALLOCATES_MEMORY
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gRnJpLCBKdWwgMTcsIDIwMjAgYXQgMDU6NDI6NDNQTSArMDMwMCwgSG9yaWEgR2VhbnTEgyB3
cm90ZToKPgo+IExvb2tzIGxpa2UgdGhlcmUncyBubyBtZW50aW9uIG9mIGEgbGltaXQgb24gc3Jj
LCBkc3Qgc2NhdHRlcmxpc3RzIHNpemUKPiB0aGF0IGNyeXB0byBpbXBsZW1lbnRhdGlvbnMgY291
bGQgdXNlIHdoZW4gcHJlLWFsbG9jYXRpbmcgbWVtb3J5Cj4gYW5kIGNyeXB0byB1c2VycyBuZWVk
aW5nIENSWVBUT19BTEdfQUxMT0NBVEVTX01FTU9SWSBzaG91bGQgYmUgYXdhcmUgb2YKPiAoZm9y
IHRoZSBjb250cmFjdCB0byBiZSBob25vdXJlZCk6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtY3J5cHRvLzc4MGNiNTAwLTIyNDEtNjFiYy1lYjQ0LTZmODcyYWQ1NjdkM0BueHAuY29t
CgpHb29kIHBvaW50LiAgSSB0aGluayB3ZSBzaG91bGQgbGltaXQgdGhpcyBmbGFnIG9ubHkgdG8g
dGhlIGNhc2VzCmFwcGxpY2FibGUgdG8gZG0tY3J5cHQsIHdoaWNoIHNlZW1zIHRvIGJlIDQgZW50
cmllcyBtYXhpbXVtLgoKQW55dGhpbmcgZWxzZSBzaG91bGQgYmUgYWxsb3dlZCB0byBhbGxvY2F0
ZSBleHRyYSBtZW1vcnkgYXMgbmVlZGVkLgoKVGhhbmtzLAotLSAKRW1haWw6IEhlcmJlcnQgWHUg
PGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KSG9tZSBQYWdlOiBodHRwOi8vZ29uZG9yLmFw
YW5hLm9yZy5hdS9+aGVyYmVydC8KUEdQIEtleTogaHR0cDovL2dvbmRvci5hcGFuYS5vcmcuYXUv
fmhlcmJlcnQvcHVia2V5LnR4dAoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJl
ZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

