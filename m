Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1725E6139E
	for <lists+dm-devel@lfdr.de>; Sun,  7 Jul 2019 05:40:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F9E730001D9;
	Sun,  7 Jul 2019 03:40:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EC4F51F03;
	Sun,  7 Jul 2019 03:40:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD1CA206D1;
	Sun,  7 Jul 2019 03:40:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x65KOffJ010802 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jul 2019 16:24:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 26133867E6; Fri,  5 Jul 2019 20:24:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF7F2867F0;
	Fri,  5 Jul 2019 20:24:36 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD13430821B2;
	Fri,  5 Jul 2019 20:24:11 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x65KNfFq195281; Fri, 5 Jul 2019 20:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=subject : from : to :
	cc : references : message-id : date : mime-version : in-reply-to :
	content-type : content-transfer-encoding; s=corp-2018-07-02;
	bh=Dw/AbW0pvyCUgARxd99Civ1QC7GhjrsbBmAQtvzYhnI=;
	b=Xl6LxEcJcd/TuQLy+8XTsCE8E2i7L/FsctUDY6ilsjn8g814Ngdx+3LDPXH+1bIN4Wp8
	yAgDV7Vo1x3ruyEQC3k4LMfx7hOtlocIFMrlOvEEDOYN39vMPENFGXCja8KfubmhwVfX
	FbJmNavOihR0T+xDYVfkdtApYbk0+j25WLVaIB0wMNdhFAbqbLGGeEmER6jYjYHpjZGt
	9M7uwCrv1LD+vJoW+VkeZU0pgYJIdndDS5aiWHo4MFc6aV0XWXMSKaXEfazXBi2qA8kE
	UURkwhQ0PTHn0fO2PNDMfvHDnYpyV3rGem7Fgw+JV8W5q6wgw9cwe/4LrqoLIqY9qxNR
	mg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2120.oracle.com with ESMTP id 2te5tc4f2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jul 2019 20:24:10 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x65KNN02033430; Fri, 5 Jul 2019 20:24:10 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3020.oracle.com with ESMTP id 2th9eckfwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jul 2019 20:24:10 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x65KO8JI025048;
	Fri, 5 Jul 2019 20:24:09 GMT
Received: from Junxiaos-MacBook-Pro.local (/10.11.58.153)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 05 Jul 2019 13:24:08 -0700
From: Junxiao Bi <junxiao.bi@oracle.com>
To: Mike Snitzer <snitzer@redhat.com>
References: <20190702231456.19121-1-junxiao.bi@oracle.com>
	<20190703162106.GA13984@redhat.com>
	<1aa51708-1c1b-bd12-72ed-ecbae39043f7@oracle.com>
Message-ID: <460d932b-e801-e2f8-9d0d-d3c96e1bb1ce@oracle.com>
Date: Fri, 5 Jul 2019 13:24:07 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1aa51708-1c1b-bd12-72ed-ecbae39043f7@oracle.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9309
	signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1907050257
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9309
	signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1907050257
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.47]); Fri, 05 Jul 2019 20:24:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Fri, 05 Jul 2019 20:24:32 +0000 (UTC) for IP:'141.146.126.78'
	DOMAIN:'aserp2120.oracle.com' HELO:'aserp2120.oracle.com'
	FROM:'junxiao.bi@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.4  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_NONE,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 141.146.126.78 aserp2120.oracle.com 141.146.126.78
	aserp2120.oracle.com <junxiao.bi@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Sat, 06 Jul 2019 23:39:13 -0400
Cc: honglei.wang@oracle.com, dm-devel@redhat.com, mpatocka@redhat.com,
	agk@redhat.com
Subject: Re: [dm-devel] dm bufio: fix deadlock issue with loop device
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Sun, 07 Jul 2019 03:40:09 +0000 (UTC)

SGkgTWlrZSwKCkRvIGkgbWFrZSBzZW5zZSBvbiB0aGlzPwoKVGhhbmtzLAoKSnVueGlhby4KCk9u
IDcvMy8xOSAxMDoxOSBBTSwgSnVueGlhbyBCaSB3cm90ZToKPiBIaSBNaWtlLAo+Cj4gVGhhbmtz
IGZvciByZXZpZXdpbmcsIHNlZSBjb21tZW50cyBpbmxpbmVkLgo+Cj4gT24gNy8zLzE5IDk6MjEg
QU0sIE1pa2UgU25pdHplciB3cm90ZToKPj4gT24gVHVlLCBKdWwgMDIgMjAxOSBhdMKgIDc6MTRw
bSAtMDQwMCwKPj4gSnVueGlhbyBCaSA8anVueGlhby5iaUBvcmFjbGUuY29tPiB3cm90ZToKPj4K
Pj4+IFRoZSBmb2xsb3dpbmcgZGVhZGxvY2sgd2FzIGNhcHV0cmVkIG9uIDQuMSwgc2luY2UgZG1f
YnVmaW9fc2hyaW5rX2NvdW50Cj4+PiBzdGlsbCBoYWQgYnVmaW8gbG9jayBhY3F1aXJlZCwgdGhp
cyB3YXMgYWxyZWFkeSBmaXhlZCBieSBtYWlubGluZS4gQnV0Cj4+PiBzaHJpbmtlciB3aWxsIGFs
c28gaW52b2tlIGRtX2J1ZmlvX3Nocmlua19zY2FuIGJ5IC0+c2Nhbl9vYmplY3RzLCBzbwo+Pj4g
bG9va3MgbGlrZSBtYWlubGluZSB3aWxsIHN1ZmZlciB0aGUgc2FtZSBkZWFkbG9jayBpc3N1ZS4K
Pj4+Cj4+PiBUaGlzIGRlYWRsb2NrIGhhcHBlbmVkIHdoZW4gYm90aCBrc3dhcGQwIGFuZCBsb29w
MSB3ZXJlIHNocmlua2luZyAKPj4+IG1lbW9yeSwKPj4+IGtzd2FwZDAgaG9sZCBidWZpbyBsb2Nr
IGFuZCB3YWl0aW5nIGZvciBhbiBpbi1mbGlnaHQgaW8gZG9uZSwgYnV0IGl0IAo+Pj4gd2lsbAo+
Pj4gbmV2ZXIgZG9uZSBiZWNhdXNlIGxvb3AxIHdobyB3YXMgaXNzdWluZyB0aGUgaW8gd2FzIGh1
bmcgYnkgdGhlIHNhbWUgCj4+PiBsb2NrCj4+PiBob2xkIGJ5IGtzd2FwZDAuIFRoaXMgd2FzIEFC
QkEgZGVhZGxvY2suCj4+Pgo+Pj4gVGhlIGdmcF9mbGFncyB1c2VkIGluIGRpcmVjdCBJTyBpcyBH
RlBfS0VSTkVMLCBzbyBjaGVja2luZyBHRlBfRlMvSU8gCj4+PiB3b24ndAo+Pj4gd29yaywganVz
dCBzdG9wIHNocmlua2luZyBpZiBsb2NrIHdhcyBob2xkIGJ5IG90aGVycy4KPj4+Cj4+PiBQSUQ6
IDQ3NMKgwqDCoCBUQVNLOiBmZmZmODgxM2UxMWY0NjAwwqAgQ1BVOiAxMMKgIENPTU1BTkQ6ICJr
c3dhcGQwIgo+Pj4gwqDCoMKgICMwIFtmZmZmODgxM2RlZGZiOTM4XSBfX3NjaGVkdWxlIGF0IGZm
ZmZmZmZmODE3M2Y0MDUKPj4+IMKgwqDCoCAjMSBbZmZmZjg4MTNkZWRmYjk5MF0gc2NoZWR1bGUg
YXQgZmZmZmZmZmY4MTczZmEyNwo+Pj4gwqDCoMKgICMyIFtmZmZmODgxM2RlZGZiOWIwXSBzY2hl
ZHVsZV90aW1lb3V0IGF0IGZmZmZmZmZmODE3NDJmZWMKPj4+IMKgwqDCoCAjMyBbZmZmZjg4MTNk
ZWRmYmE2MF0gaW9fc2NoZWR1bGVfdGltZW91dCBhdCBmZmZmZmZmZjgxNzNmMTg2Cj4+PiDCoMKg
wqAgIzQgW2ZmZmY4ODEzZGVkZmJhYTBdIGJpdF93YWl0X2lvIGF0IGZmZmZmZmZmODE3NDAzNGYK
Pj4+IMKgwqDCoCAjNSBbZmZmZjg4MTNkZWRmYmFjMF0gX193YWl0X29uX2JpdCBhdCBmZmZmZmZm
ZjgxNzNmZWM4Cj4+PiDCoMKgwqAgIzYgW2ZmZmY4ODEzZGVkZmJiMTBdIG91dF9vZl9saW5lX3dh
aXRfb25fYml0IGF0IGZmZmZmZmZmODE3M2ZmODEKPj4+IMKgwqDCoCAjNyBbZmZmZjg4MTNkZWRm
YmI5MF0gX19tYWtlX2J1ZmZlcl9jbGVhbiBhdCBmZmZmZmZmZmEwMzg3MzZmIAo+Pj4gW2RtX2J1
ZmlvXQo+Pj4gwqDCoMKgICM4IFtmZmZmODgxM2RlZGZiYmIwXSBfX3RyeV9ldmljdF9idWZmZXIg
YXQgZmZmZmZmZmZhMDM4N2JiOCAKPj4+IFtkbV9idWZpb10KPj4+IMKgwqDCoCAjOSBbZmZmZjg4
MTNkZWRmYmJkMF0gZG1fYnVmaW9fc2hyaW5rX3NjYW4gYXQgZmZmZmZmZmZhMDM4N2NjMyAKPj4+
IFtkbV9idWZpb10KPj4+IMKgwqAgIzEwIFtmZmZmODgxM2RlZGZiYzQwXSBzaHJpbmtfc2xhYiBh
dCBmZmZmZmZmZjgxMWE4N2NlCj4+PiDCoMKgICMxMSBbZmZmZjg4MTNkZWRmYmQzMF0gc2hyaW5r
X3pvbmUgYXQgZmZmZmZmZmY4MTFhZDc3OAo+Pj4gwqDCoCAjMTIgW2ZmZmY4ODEzZGVkZmJkYzBd
IGtzd2FwZCBhdCBmZmZmZmZmZjgxMWFlOTJmCj4+PiDCoMKgICMxMyBbZmZmZjg4MTNkZWRmYmVj
MF0ga3RocmVhZCBhdCBmZmZmZmZmZjgxMGE4NDI4Cj4+PiDCoMKgICMxNCBbZmZmZjg4MTNkZWRm
YmY1MF0gcmV0X2Zyb21fZm9yayBhdCBmZmZmZmZmZjgxNzQ1MjQyCj4+Pgo+Pj4gwqDCoCBQSUQ6
IDE0MTI3wqAgVEFTSzogZmZmZjg4MTQ1NTc0OWMwMMKgIENQVTogMTHCoCBDT01NQU5EOiAibG9v
cDEiCj4+PiDCoMKgwqAgIzAgW2ZmZmY4ODI3MmY1YWYyMjhdIF9fc2NoZWR1bGUgYXQgZmZmZmZm
ZmY4MTczZjQwNQo+Pj4gwqDCoMKgICMxIFtmZmZmODgyNzJmNWFmMjgwXSBzY2hlZHVsZSBhdCBm
ZmZmZmZmZjgxNzNmYTI3Cj4+PiDCoMKgwqAgIzIgW2ZmZmY4ODI3MmY1YWYyYTBdIHNjaGVkdWxl
X3ByZWVtcHRfZGlzYWJsZWQgYXQgZmZmZmZmZmY4MTczZmQ1ZQo+Pj4gwqDCoMKgICMzIFtmZmZm
ODgyNzJmNWFmMmIwXSBfX211dGV4X2xvY2tfc2xvd3BhdGggYXQgZmZmZmZmZmY4MTc0MWZiNQo+
Pj4gwqDCoMKgICM0IFtmZmZmODgyNzJmNWFmMzMwXSBtdXRleF9sb2NrIGF0IGZmZmZmZmZmODE3
NDIxMzMKPj4+IMKgwqDCoCAjNSBbZmZmZjg4MjcyZjVhZjM1MF0gZG1fYnVmaW9fc2hyaW5rX2Nv
dW50IGF0IGZmZmZmZmZmYTAzODY1ZjkgCj4+PiBbZG1fYnVmaW9dCj4+PiDCoMKgwqAgIzYgW2Zm
ZmY4ODI3MmY1YWYzODBdIHNocmlua19zbGFiIGF0IGZmZmZmZmZmODExYTg2YmQKPj4+IMKgwqDC
oCAjNyBbZmZmZjg4MjcyZjVhZjQ3MF0gc2hyaW5rX3pvbmUgYXQgZmZmZmZmZmY4MTFhZDc3OAo+
Pj4gwqDCoMKgICM4IFtmZmZmODgyNzJmNWFmNTAwXSBkb190cnlfdG9fZnJlZV9wYWdlcyBhdCBm
ZmZmZmZmZjgxMWFkYjM0Cj4+PiDCoMKgwqAgIzkgW2ZmZmY4ODI3MmY1YWY1OTBdIHRyeV90b19m
cmVlX3BhZ2VzIGF0IGZmZmZmZmZmODExYWRlZjgKPj4+IMKgwqAgIzEwIFtmZmZmODgyNzJmNWFm
NjEwXSBfX2FsbG9jX3BhZ2VzX25vZGVtYXNrIGF0IGZmZmZmZmZmODExYTA5YzMKPj4+IMKgwqAg
IzExIFtmZmZmODgyNzJmNWFmNzEwXSBhbGxvY19wYWdlc19jdXJyZW50IGF0IGZmZmZmZmZmODEx
ZThiNzEKPj4+IMKgwqAgIzEyIFtmZmZmODgyNzJmNWFmNzYwXSBuZXdfc2xhYiBhdCBmZmZmZmZm
ZjgxMWY0NTIzCj4+PiDCoMKgICMxMyBbZmZmZjg4MjcyZjVhZjdiMF0gX19zbGFiX2FsbG9jIGF0
IGZmZmZmZmZmODE3M2ExYjUKPj4+IMKgwqAgIzE0IFtmZmZmODgyNzJmNWFmODgwXSBrbWVtX2Nh
Y2hlX2FsbG9jIGF0IGZmZmZmZmZmODExZjQ4NGIKPj4+IMKgwqAgIzE1IFtmZmZmODgyNzJmNWFm
OGQwXSBkb19ibG9ja2Rldl9kaXJlY3RfSU8gYXQgZmZmZmZmZmY4MTI1MzViMwo+Pj4gwqDCoCAj
MTYgW2ZmZmY4ODI3MmY1YWZiMDBdIF9fYmxvY2tkZXZfZGlyZWN0X0lPIGF0IGZmZmZmZmZmODEy
NTVkYzMKPj4+IMKgwqAgIzE3IFtmZmZmODgyNzJmNWFmYjMwXSB4ZnNfdm1fZGlyZWN0X0lPIGF0
IGZmZmZmZmZmYTAxZmUzZmMgW3hmc10KPj4+IMKgwqAgIzE4IFtmZmZmODgyNzJmNWFmYjkwXSBn
ZW5lcmljX2ZpbGVfcmVhZF9pdGVyIGF0IGZmZmZmZmZmODExOTg5OTQKPj4+IMKgwqAgIzE5IFtm
ZmZmODgyNzJmNWFmYzUwXSBfX2R0YV94ZnNfZmlsZV9yZWFkX2l0ZXJfMjM5OCBhdCAKPj4+IGZm
ZmZmZmZmYTAyMGM5NzAgW3hmc10KPj4+IMKgwqAgIzIwIFtmZmZmODgyNzJmNWFmY2MwXSBsb19y
d19haW8gYXQgZmZmZmZmZmZhMDM3NzA0MiBbbG9vcF0KPj4+IMKgwqAgIzIxIFtmZmZmODgyNzJm
NWFmZDcwXSBsb29wX3F1ZXVlX3dvcmsgYXQgZmZmZmZmZmZhMDM3N2MzYiBbbG9vcF0KPj4+IMKg
wqAgIzIyIFtmZmZmODgyNzJmNWFmZTYwXSBrdGhyZWFkX3dvcmtlcl9mbiBhdCBmZmZmZmZmZjgx
MGE4YTBjCj4+PiDCoMKgICMyMyBbZmZmZjg4MjcyZjVhZmVjMF0ga3RocmVhZCBhdCBmZmZmZmZm
ZjgxMGE4NDI4Cj4+PiDCoMKgICMyNCBbZmZmZjg4MjcyZjVhZmY1MF0gcmV0X2Zyb21fZm9yayBh
dCBmZmZmZmZmZjgxNzQ1MjQyCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSnVueGlhbyBCaSA8anVu
eGlhby5iaUBvcmFjbGUuY29tPgo+Pj4gLS0tCj4+PiDCoCBkcml2ZXJzL21kL2RtLWJ1ZmlvLmMg
fCA0ICstLS0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlv
bnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9kbS1idWZpby5jIGIvZHJpdmVy
cy9tZC9kbS1idWZpby5jCj4+PiBpbmRleCAyYTQ4ZWEzZjFiMzAuLmI2YjVhY2M5MmNhMiAxMDA2
NDQKPj4+IC0tLSBhL2RyaXZlcnMvbWQvZG0tYnVmaW8uYwo+Pj4gKysrIGIvZHJpdmVycy9tZC9k
bS1idWZpby5jCj4+PiBAQCAtMTU5OSw5ICsxNTk5LDcgQEAgZG1fYnVmaW9fc2hyaW5rX3NjYW4o
c3RydWN0IHNocmlua2VyICpzaHJpbmssIAo+Pj4gc3RydWN0IHNocmlua19jb250cm9sICpzYykK
Pj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBmcmVlZDsKPj4+IMKgIMKgwqDCoMKgwqAgYyA9
IGNvbnRhaW5lcl9vZihzaHJpbmssIHN0cnVjdCBkbV9idWZpb19jbGllbnQsIHNocmlua2VyKTsK
Pj4+IC3CoMKgwqAgaWYgKHNjLT5nZnBfbWFzayAmIF9fR0ZQX0ZTKQo+Pj4gLcKgwqDCoMKgwqDC
oMKgIGRtX2J1ZmlvX2xvY2soYyk7Cj4+PiAtwqDCoMKgIGVsc2UgaWYgKCFkbV9idWZpb190cnls
b2NrKGMpKQo+Pj4gK8KgwqDCoCBpZiAoIWRtX2J1ZmlvX3RyeWxvY2soYykpCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIFNIUklOS19TVE9QOwo+Pj4gwqAgwqDCoMKgwqDCoCBmcmVlZMKg
ID0gX19zY2FuKGMsIHNjLT5ucl90b19zY2FuLCBzYy0+Z2ZwX21hc2spOwo+Pj4gLS0gCj4+PiAy
LjE3LjEKPj4+Cj4+IEkgZG9uJ3QgZm9sbG93IGhvdyB0aGlzIGZpeGVzIHRoZSBkaXJlY3QgSU8g
dG8gRE0gZGV2aWNlIG9udG9wIG9mIGxvb3AKPj4gY2FzZSBnaXZlbiB0aGF0IHlvdSdyZSBzYXlp
bmcgX19HRlBfRlMgd2lsbCBub3QgaGF2ZSBiZWVuIHNldCBieSB0aGUKPj4gZGlyZWN0IElPIHBh
dGguwqAgSW4gdGhhdCBjYXNlIGl0IHNob3VsZCByZXNvcnQgdG8gdGhlIHRyeWxvY2sgYW55d2F5
LAo+PiBubz8KPiBTZWUgdGhlIGNhbGwgdHJhY2Ugb2YgbG9vcCwgaW4gZG9fYmxvY2tkZXZfZGly
ZWN0X0lPKCksIHRvIGFsbG9jIGRpbywgCj4gR0ZQX0tFUk5FTCB3YXMgdXNlZCwgX19HRlBfRlMg
d2FzIGltcGxpZWQgYnkgaXQuIFNvIGl0IGh1bmcgYnkgYnVmaW8gCj4gbG9jay4KPj4KPj4gV2Ug
bmVlZCBhIHJlcHJvZHVjZXIgaW4gdGhlIGNvbnRleHQgb2YgdGhlIGxhdGVzdCB1cHN0cmVhbSBr
ZXJuZWwgY29kZSwKPj4gbm90IHNvbWUgNC4xIGJyYW5jaCBwb2ludCBmb3IgYW4gT3JhY2xlIGtl
cm5lbC4KPj4KPj4gUGxlYXNlIHN1Ym1pdCB3aXRoIGEgbGVzcyBjb25mbGF0ZWQgcGF0Y2ggaGVh
ZGVyIHRoYXQgaGFzIGEgZGVzY3JpcHRpb24KPj4gb2YgdGhlIGJ1ZmlvIGlzc3VlIHRoYXQgdGhl
IHVwc3RyZWFtIGtlcm5lbCBoYXMuCj4gVGhlIGNhbGwgdHJhY2UgaXMganVzdCB0byBnaXZlIGFu
IGV4YW1wbGUgb2YgdGhlIGRlYWRsb2NrLiBNYWlubGluZSAKPiBkaWRuJ3QgdXNlIGxvY2sgaW4g
ZG1fYnVmaW9fc2hyaW5rX2NvdW50LCBidXQgaXQgZG9lcyB1c2UgaW4KPgo+IGRtX2J1ZmlvX3No
cmlua19zY2FuIHdoaWNoIHdpbGwgYmUgaW52b2tlZCBieSB0aGUgbWVtb3J5IHNocmlua2VyIGlu
IAo+IHRoZSBzYW1lIGNvbnRleHQgYnkgbG9vcCwgc28gaXQgd2lsbCBzdWZmZXIgdGhlIHNhbWUg
ZGVhZGxvY2suCj4gVGhpcyBpcyBoYXJkIHRvIHJlcHJvZHVjZSBhbmQgY3VzdG9tZXIgaGVscCB1
cyByZXByb2R1Y2VkIGl0LCB3ZSBkb24ndCAKPiByZXByb2R1Y2UgaXQuCj4KPiBUaGFua3MsCj4g
SnVueGlhbwo+Cj4+Cj4+IFRoYW5rcywKPj4gTWlrZQoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0
CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2RtLWRldmVs
