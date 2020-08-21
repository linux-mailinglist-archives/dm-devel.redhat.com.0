Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D6D8924DB55
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 18:38:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-LZckoa-YOt-0AKimQRs8gg-1; Fri, 21 Aug 2020 12:38:14 -0400
X-MC-Unique: LZckoa-YOt-0AKimQRs8gg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F9EF81F034;
	Fri, 21 Aug 2020 16:38:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 241C4756DE;
	Fri, 21 Aug 2020 16:38:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD9B7662C1;
	Fri, 21 Aug 2020 16:38:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LAb5wt010392 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 06:37:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7377C203B863; Fri, 21 Aug 2020 10:37:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 071B0207AEB5
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 10:37:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 859CC18A0710
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 10:37:02 +0000 (UTC)
Received: from m1543.mail.126.com (m1543.mail.126.com [220.181.15.43])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-349-DBTW76goNZu806FpAVHDnA-1; Fri, 21 Aug 2020 06:36:59 -0400
X-MC-Unique: DBTW76goNZu806FpAVHDnA-1
Received: from xianting_tian$126.com ( [112.17.247.81] ) by
	ajax-webmail-wmsvr43 (Coremail) ; Fri, 21 Aug 2020 18:02:32 +0800
	(GMT+08:00)
X-Originating-IP: [112.17.247.81]
Date: Fri, 21 Aug 2020 18:02:32 +0800 (GMT+08:00)
From: =?utf-8?B?55Sw?= <xianting_tian@126.com>
To: "Hannes Reinecke" <hare@suse.de>
X-Priority: 3
In-Reply-To: <4df016bc-570c-d166-47dd-36a9f21fad13@suse.de>
References: <20200821085600.2395666-1-hch@lst.de>
	<20200821085600.2395666-3-hch@lst.de>
	<4df016bc-570c-d166-47dd-36a9f21fad13@suse.de>
MIME-Version: 1.0
Message-ID: <133efc8b.1649.17410784734.Coremail.xianting_tian@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: K8qowAD3uxS5mz9fFY5fAA--.26471W
X-CM-SenderInfo: h0ld03plqjs3xldqqiyswou0bp/1tbi9BKHpFpD-L3eawABsp
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 21 Aug 2020 12:37:46 -0400
Cc: Jens Axboe <axboe@kernel.dk>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	Jan Hoeppner <hoeppner@linux.ibm.com>, Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Stefan Haberland <sth@linux.ibm.com>,
	"nbd@other.debian.org" <nbd@other.debian.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 2/2] block: fix locking for struct
 block_device size updates
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============5601014413426987692=="

--===============5601014413426987692==
Content-Type: multipart/alternative; 
	boundary="----=_Part_16762_1838007221.1598004152116"

------=_Part_16762_1838007221.1598004152116
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

dGhhbmtzIEhlbGx3aWcgZm9yIHlvdXIga2luZGx5IHJlcGx5IGFuZCB5b3VyIGZpeCBhbmQgYWRk
IHJlcG9ydCBieSBtZSA6KQoKCk9uIDA4LzIxLzIwMjAgMTc6MjYsIEhhbm5lcyBSZWluZWNrZSB3
cm90ZToKT24gOC8yMS8yMCAxMDo1NiBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gVHdv
IGRpZmZlcmVudCBjYWxsZXJzIHVzZSB0d28gZGlmZmVyZW50IG11dGV4ZXMgZm9yIHVwZGF0aW5n
IHRoZQo+IGJsb2NrIGRldmljZSBzaXplLCB3aGljaCBvYnZpb3VzbHkgZG9lc24ndCBoZWxwIHRv
IGFjdHVhbGx5IHByb3RlY3QKPiBhZ2FpbnN0IGNvbmN1cnJlbnQgdXBkYXRlcyBmcm9tIHRoZSBk
aWZmZXJlbnQgY2FsbGVycy4gIEluIGFkZGl0aW9uCj4gb25lIG9mIHRoZSBsb2NrcywgYmRfbXV0
ZXggaXMgcmF0aGVyIHByb25lIHRvIGRlYWRsb2NrcyB3aXRoIG90aGVyCj4gcGFydHMgb2YgdGhl
IGJsb2NrIHN0YWNrIHRoYXQgdXNlIGl0IGZvciBoaWdoIGxldmVsIHN5bmNocm9uaXphdGlvbi4K
Pgo+IFN3aXRjaCB0byB1c2luZyBhIG5ldyBzcGlubG9jayBwcm90ZWN0aW5nIGp1c3QgdGhlIHNp
emUgdXBkYXRlcywgYXMKPiB0aGF0IGlzIGFsbCB3ZSBuZWVkLCBhbmQgbWFrZSBzdXJlIGV2ZXJ5
b25lIGRvZXMgdGhlIHVwZGF0ZSB0aHJvdWdoCj4gdGhlIHByb3BlciBoZWxwZXIuCj4KPiBUaGlz
IGZpeGXRlSBhIGJ1ZyByZXBvcnRlZCB3aXRoIHRoZSBudm1lIHJldmFsaWRhdGluZyBkaXNrcyBk
dXJpbmcgYQo+IGhvdCByZW1vdmFsIG9wZXJhdGlvbi4KPgo+IFJlcG9ydGVkLWJ5OiBYaWFudGlu
ZyBUaWFuIDx4aWFudGluZ190aWFuQDEyNi5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3Bo
IEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gIGJsb2NrL3BhcnRpdGlvbnMvY29yZS5jICAg
ICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvYmxvY2svYW9lL2FvZWNtZC5jICAgICAgfCAgNCAr
LS0tCj4gIGRyaXZlcnMvbWQvZG0uYyAgICAgICAgICAgICAgICAgfCAxNSArKy0tLS0tLS0tLS0t
LS0KPiAgZHJpdmVycy9zMzkwL2Jsb2NrL2Rhc2RfaW9jdGwuYyB8ICA5ICsrLS0tLS0tLQo+ICBm
cy9ibG9ja19kZXYuYyAgICAgICAgICAgICAgICAgIHwgMTggKysrKysrKysrLS0tLS0tLS0tCj4g
IGluY2x1ZGUvbGludXgvYmxrX3R5cGVzLmggICAgICAgfCAgMSArCj4gIDYgZmlsZXMgY2hhbmdl
ZCwgMTcgaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pCj4KUmV2aWV3ZWQtYnk6IEhhbm5l
cyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPgoKQ2hlZXJzLAoKSGFubmVzCi0tCkRyLiBIYW5uZXMg
UmVpbmVja2UgICAgICAgICAgICAgICAgICAgICBLZXJuZWwgU3RvcmFnZSBBcmNoaXRlY3QKaGFy
ZUBzdXNlLmRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2
ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJILCBNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHRjogRmVsaXggSW1lbmTD
tnJmZmVyCg==
------=_Part_16762_1838007221.1598004152116
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+CjxoZWFkPgogICAgPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50
PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPgo8L2hlYWQ+Cjxib2R5Pgo8ZGl2IHN0eWxlPSJs
aW5lLWhlaWdodDoxLjY7Zm9udC1mYW1pbHk6J+iLueaWuScsJ+W+rui9r+mbhem7kScsJ3NhbnMt
c2VyaWYnOyI+dGhhbmtzIEhlbGx3aWcgZm9yIHlvdXIga2luZGx5IHJlcGx5IGFuZCB5b3VyIGZp
eCBhbmQgYWRkIHJlcG9ydCBieSBtZSA6KTxicj48YnI+PC9kaXY+PGRpdiBjbGFzcz0ibmUtcXVv
dGVkIj48YmxvY2txdW90ZSBpZD0ibnRlcy1hbmRyaW9kbWFpbC1xdW90ZSIgc3R5bGU9Im1hcmdp
bjowcHggIWltcG9ydGFudDtwYWRkaW5nOjBweCAhaW1wb3J0YW50O2JvcmRlcjogbm9uZSAhaW1w
b3J0YW50OyI+PGRpdiBjbGFzcz0iSi1yZXBseSIgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6I2Yy
ZjJmMjtjb2xvcjpibGFjaztwYWRkaW5nLXRvcDo2cHg7cGFkZGluZy1ib3R0b206NnB4O2JvcmRl
ci1yYWRpdXM6M3B4Oy1tb3otYm9yZGVyLXJhZGl1czozcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVz
OjNweDttYXJnaW4tdG9wOjQ1cHg7bWFyZ2luLWJvdHRvbToyMHB4OyI+CiAgICA8ZGl2IHN0eWxl
PSJmb250LXNpemU6MTRweDtsaW5lLWhlaWdodDoxLjU7d29yZC1icmVhazpicmVhay1hbGw7bWFy
Z2luLWxlZnQ6MTBweDttYXJnaW4tcmlnaHQ6MTBweCI+T24gPHNwYW4gY2xhc3M9Im1haWwtZGF0
ZSI+MDgvMjEvMjAyMCAxNzoyNjwvc3Bhbj4sIDxhIGNsYXNzPSJtYWlsLXRvIiBzdHlsZT0idGV4
dC1kZWNvcmF0aW9uOm5vbmU7Y29sb3I6IzJhOTdmZjsiIGhyZWY9Im1haWx0bzpoYXJlQHN1c2Uu
ZGUiPkhhbm5lcyBSZWluZWNrZTwvYT4gd3JvdGU6PC9kaXY+CjwvZGl2Pk9uIDgvMjEvMjAgMTA6
NTYgQU0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo8YnI+Jmd0OyBUd28gZGlmZmVyZW50IGNh
bGxlcnMgdXNlIHR3byBkaWZmZXJlbnQgbXV0ZXhlcyBmb3IgdXBkYXRpbmcgdGhlCjxicj4mZ3Q7
IGJsb2NrIGRldmljZSBzaXplLCB3aGljaCBvYnZpb3VzbHkgZG9lc24ndCBoZWxwIHRvIGFjdHVh
bGx5IHByb3RlY3QKPGJyPiZndDsgYWdhaW5zdCBjb25jdXJyZW50IHVwZGF0ZXMgZnJvbSB0aGUg
ZGlmZmVyZW50IGNhbGxlcnMuICZuYnNwO0luIGFkZGl0aW9uCjxicj4mZ3Q7IG9uZSBvZiB0aGUg
bG9ja3MsIGJkX211dGV4IGlzIHJhdGhlciBwcm9uZSB0byBkZWFkbG9ja3Mgd2l0aCBvdGhlcgo8
YnI+Jmd0OyBwYXJ0cyBvZiB0aGUgYmxvY2sgc3RhY2sgdGhhdCB1c2UgaXQgZm9yIGhpZ2ggbGV2
ZWwgc3luY2hyb25pemF0aW9uLgo8YnI+Jmd0OyAKPGJyPiZndDsgU3dpdGNoIHRvIHVzaW5nIGEg
bmV3IHNwaW5sb2NrIHByb3RlY3RpbmcganVzdCB0aGUgc2l6ZSB1cGRhdGVzLCBhcwo8YnI+Jmd0
OyB0aGF0IGlzIGFsbCB3ZSBuZWVkLCBhbmQgbWFrZSBzdXJlIGV2ZXJ5b25lIGRvZXMgdGhlIHVw
ZGF0ZSB0aHJvdWdoCjxicj4mZ3Q7IHRoZSBwcm9wZXIgaGVscGVyLgo8YnI+Jmd0OyAKPGJyPiZn
dDsgVGhpcyBmaXhl0ZUgYSBidWcgcmVwb3J0ZWQgd2l0aCB0aGUgbnZtZSByZXZhbGlkYXRpbmcg
ZGlza3MgZHVyaW5nIGEKPGJyPiZndDsgaG90IHJlbW92YWwgb3BlcmF0aW9uLgo8YnI+Jmd0OyAK
PGJyPiZndDsgUmVwb3J0ZWQtYnk6IFhpYW50aW5nIFRpYW4gJmx0O3hpYW50aW5nX3RpYW5AMTI2
LmNvbSZndDsKPGJyPiZndDsgU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgJmx0O2hj
aEBsc3QuZGUmZ3Q7Cjxicj4mZ3Q7IC0tLQo8YnI+Jmd0OyAmbmJzcDtibG9jay9wYXJ0aXRpb25z
L2NvcmUuYyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgfCAmbmJzcDs0ICsrLS0KPGJyPiZn
dDsgJm5ic3A7ZHJpdmVycy9ibG9jay9hb2UvYW9lY21kLmMgJm5ic3A7ICZuYnNwOyAmbmJzcDt8
ICZuYnNwOzQgKy0tLQo8YnI+Jmd0OyAmbmJzcDtkcml2ZXJzL21kL2RtLmMgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyB8IDE1ICsrLS0tLS0t
LS0tLS0tLQo8YnI+Jmd0OyAmbmJzcDtkcml2ZXJzL3MzOTAvYmxvY2svZGFzZF9pb2N0bC5jIHwg
Jm5ic3A7OSArKy0tLS0tLS0KPGJyPiZndDsgJm5ic3A7ZnMvYmxvY2tfZGV2LmMgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt8IDE4
ICsrKysrKysrKy0tLS0tLS0tLQo8YnI+Jmd0OyAmbmJzcDtpbmNsdWRlL2xpbnV4L2Jsa190eXBl
cy5oICZuYnNwOyAmbmJzcDsgJm5ic3A7IHwgJm5ic3A7MSArCjxicj4mZ3Q7ICZuYnNwOzYgZmls
ZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pCjxicj4mZ3Q7IAo8
YnI+UmV2aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNrZSAmbHQ7aGFyZUBzdXNlLmRlJmd0Owo8YnI+
Cjxicj5DaGVlcnMsCjxicj4KPGJyPkhhbm5lcwo8YnI+LS0gCjxicj5Eci4gSGFubmVzIFJlaW5l
Y2tlJm5ic3A7ICZuYnNwOyAmbmJzcDsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7IEtlcm5lbCBTdG9yYWdlIEFyY2hpdGVjdAo8YnI+aGFyZUBz
dXNlLmRlJm5ic3A7ICZuYnNwOyAmbmJzcDsmbmJzcDsgJm5ic3A7ICZuYnNwOyZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7KzQ5IDkxMSA3NDA1MyA2ODgKPGJyPlNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCjxicj5IUkIg
MzY4MDkgKEFHIE7DvHJuYmVyZyksIEdGOiBGZWxpeCBJbWVuZMO2cmZmZXIKPGJyPjwvYmxvY2tx
dW90ZT48L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+
------=_Part_16762_1838007221.1598004152116--

--===============5601014413426987692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============5601014413426987692==--

